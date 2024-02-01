from shutil import get_unpack_formats
import numpy as np
from scipy import spatial
from scipy import stats
from sklearn.neighbors import NearestNeighbors
from sklearn import preprocessing

import seaborn as sns
import matplotlib.pyplot as plt

import data_manip
import ml
import utils
import metrics
import pandas as pd

import warnings
warnings.filterwarnings("ignore", category=FutureWarning) 

class BaseTest():
    """
    Base Class for our tests.
    """
    def __init__(self, name, description, type):
        """
        Name = Name of test
        Description = Description of how the test works
        Type = Smell Category
        """
        self.test_name = name
        self.test_description = description
        self.test_type = type

    def pipeline(self):
        """
        We implement the pipeline method for all tests,
        running the test and returning output in Dict
        format.
        """
        pass


class CosineTest(BaseTest):
    def __init__(self):
        super(CosineTest, self).__init__("Cosine Similarity Test",
                                         "Approximates cluster size of input flows, returning a result between 0 and 1.\
We also track the number of flows that are effectively identical (according to \
some cut-off value), returning a result between 0 and 1", 
                                          "Repetitiveness")

    def cosine_similarity(self, data, num_points=1000):
        """
        Calculate the cosine similarity between `num_points' randomly sampled pairs.
        Assumes data has been split up into clusters, indicated by 'Cluster' column.
        """
        separated_results_list = []
        results_dict = {}
        clusters = data['Cluster']
        cluster_list, cluster_value_list = utils.get_ordered_unique_values(clusters)

        for cluster_value in cluster_list:
            result_list = []
            cluster_data = data[data['Cluster'] == cluster_value]
            for _ in range(0, num_points):
                samples = cluster_data.sample(n=2) # Randomly sample 2 points
                samples = samples.drop(['Cluster'], axis=1) # Drop Cluster column before calculating cosine similarities
                result = 1 - \
                    spatial.distance.cosine(samples.iloc[0], samples.iloc[1]) # Calculate cosine distance, and subtract from 1 to calculate cosine similarities
                    # Could add a check here to ensure there are no collisions between sample1 and sample2
                result_list.append(result)
            separated_results_list.append(result_list) # Keep the results of each cluster separated
            results_dict[cluster_value] = separated_results_list[(cluster_value-1)]
        return separated_results_list, cluster_value_list

    def cosSimResults(self, cos_sim, num_points=1000, cutoff=0.95):
        """
        Organise Cosine Similarity results by calculating mean scores
        as well as the number of flows that are above the cutoff score
        (and we consider to be effectively identical).
        """
        identikit = {}
        for idx, cs in enumerate(cos_sim):
            identikit[idx+1] = [sim for sim in cs if sim > cutoff]
        for key in identikit.keys():
            identikit[key] = len(identikit[key]) / num_points
        return np.mean(cos_sim, axis=1).tolist(), identikit

    def cosSimPipeline(self, df, num_points):
        """
        Run Cosign Similarity pipeline.
        1) Calculate number of clusters via elbow method
        2) Calculate Clusters
        3) Calculate Cosine Similarities for each Cluster, weighted
        4) Calculate Results
        """
        n_clusters = utils.calculateElbowValue(df)
        print(f"[*] {n_clusters} Clusters")
        if n_clusters == None:
            n_clusters = 1
        df, _ = ml.calculateClusters(df, n_clusters)
        cos_sim, weights = self.cosine_similarity(df, num_points)
        averages, cutoff = self.cosSimResults(cos_sim, num_points)
        return averages, cutoff, weights

    def pipeline(self, df, metadata, target, num_points=1000):
        """
        Run Full Pipeline.
        """
        results_dict = {}
        cos = None
        cut = None
        try:
            data = data_manip.reformatForCosine(df, metadata, target)
            cos, cut, weights = self.cosSimPipeline(data, num_points)
            results_dict["Cosine Similarities"] = cos # Cosine Similarities
            results_dict["Cosine Weighted Average"] = np.average(cos, weights=[weight/sum(weights) for weight in weights]) # Get Weighted Average for each cluster
            results_dict["Largest Cluster Percentage"] = weights[0]/sum(weights) # Get the largest cluster size
            results_dict["Cutoff Percentages"] = cut # Percentage of Cutoff values
            results_dict["Cluster Sizes"] = weights # Size of each cluster
        except Exception as e:
            print(e)
        return results_dict


class PortTest(BaseTest):
    def __init__(self):
        super(PortTest, self).__init__("Port Test", "Returns the percentage of flows associated with\
background traffic according to their destination port number.",
                                                    "Mislabelled")

    def pipeline(self, df, metadata, target):
        """
        Get the number of flows whose destination port is connected to an unusual port
        """
        results_dict = {}
        tot_count = 0
        dport = metadata["dst_port"] # Get Destination Port Column
        unique_ports = metadata["ignore_ports"] # Get ports we think should have been ignored
        label_field = metadata["label_field"] # Get label column
        for port in unique_ports:
            tot_count += df[(df[label_field] == target) &
                            (df[dport] == port)].shape[0]
        results_dict["MislabelPorts"] = tot_count # Return total number of flows
        results_dict["MislabelPortsPercent"] = (tot_count / df[df[label_field] == target].shape[0]) # Return the percentage of flows
        return results_dict


class BackwardPacketsTest(BaseTest):
    """
    Backwards Packets Test (Unused)
    The lack of communication from Server -> Host implies
    that the target system isn't properly responding to input
    """
    def __init__(self):
        super(BackwardPacketsTest, self).__init__(
            "Backward Packets", "Returns the percentage of flows with no packets \
in the backwards (server to host) direction.",
            "Mislabelled")

    def pipeline(self, df, metadata, target):
        """
        Run Pipeline
        """
        results_dict = {}
        label_field = metadata["label_field"]
        bwd = metadata["backward_field"]
        length = df[df[label_field] == target].shape[0]
        bwdLength = df[(df[label_field] == target) & (df[bwd] == 0)].shape[0]

        results_dict["BackwardsPercent"] = (bwdLength / length)
        results_dict["TotalBackwards"] = length
        return results_dict


class NearestNeighboursTest(BaseTest):
    def __init__(self):
        super(NearestNeighboursTest, self).__init__(
            "Nearest Neighbours Test", "Returns the percentage of flows that are\
mislabelled according to the Edited Nearest\
Neighbours Criteria.",
                                       "Mislabelled")

    def mislabelNN(self, df, metadata, target, num_points=1000000):

        benign_label = metadata["benign_label"]
        if benign_label == None:
            benign_label = "Other"
        label_field = metadata["label_field"]

        neigh = NearestNeighbors(n_neighbors=4, radius=0.5) # Calculate Nearest Neighbours
        combined_df = df[(df[label_field] == benign_label)
                       | (df[label_field] == target)] # Get Combined DF
        combined_df = combined_df.reset_index(drop=True)
        if combined_df.shape[0] < num_points:
            num_points = combined_df.shape[0] # If they're aren't enough points, reset num_points
        combined_df = combined_df.sample(num_points) # Sample num_points points from combined DF
        attack_df = df[(df[label_field] == target)]
        neigh.fit(combined_df.loc[:, df.columns != label_field])
        knn = neigh.kneighbors(attack_df.loc[:, df.columns != label_field])
        return knn, combined_df, attack_df

    def pipeline(self, df, metadata, target, num_points=1000000):
        benign_label = metadata["benign_label"]
        label_field = metadata["label_field"]
        results_dict = {}
        if target == benign_label:
            return
        if benign_label == None:
            targets = [target]
        else:
            targets = [benign_label, target]
        cluster_df, labels = data_manip.reformatForClustering(
            df, metadata, targets=targets)
        cluster_df[label_field] = labels
        knn, benign_df, _ = self.mislabelNN(cluster_df, metadata, target, num_points)
        mislabel = 0
        for idx in knn[1]:
            try:
                counts = benign_df.iloc[idx][label_field].value_counts()[benign_label]
            except Exception as e:
                counts = 0
            if counts >= 2:
                mislabel += 1
        results_dict["Mislabelled"] = mislabel
        results_dict["Percentage"] = (mislabel / knn[1].shape[0])
        return results_dict

class RollingImportancesTest(BaseTest):
    def __init__(self):
        super(RollingImportancesTest, self).__init__("Rolling Importances Test", 
                                                     "Orders features according to mutual information\
and then measures efficacy of 5 features together\
for classification using random forest. Outputs JSON file \
with F1 score for each group of 5 features. (Unused, not particularly useful)",
                                                      "Simulation Artefacts")

    def pipeline(self, df, metadata, target):
        cols = []
        results = []
        f1_scores = {}
        results_dict = {}
        info = metrics.InfoGainMetric()
        importances = info.apply_metric(df, metadata, target)
        importDf = pd.DataFrame(importances, index=[0])
        df, labels = data_manip.reformatForML(df, metadata, target)
        for i in range(0, len(importDf.columns) - 5):
            five = importDf.columns[i:i+5]
            train_features, train_labels, test_features, test_labels = data_manip.getTrainTestFeatures(df[five], labels)
            predictions, test_score, _ = ml.ids("Forest", train_features, train_labels, test_features, test_labels)
            f1 = ml.results(test_score, predictions, test_labels)
            results.append(test_score)
            cols.append(five.tolist())
            f1_scores[five[-1]] = f1
        results_dict["Columns"] = cols
        results_dict["F1Scores"] = f1_scores
        return results_dict

class DropRollingImportancesTest(BaseTest):
    def __init__(self):
        super(DropRollingImportancesTest, self).__init__("Rolling Importances With Drop Test", 
                                                         "Rolling Importances with Drop. (Unused,\
not particularly useful)", 
                                                         "Simulation Artefacts")

    def pipeline(self, df, metadata, target):
        cols = []
        current_features = []
        f1_scores = {}
        results_dict = {}
        info = metrics.InfoGainMetric()
        importances = info.apply_metric(df, metadata, target)
        importDf = pd.DataFrame(importances, index=[0])
        df = df.sample(frac=0.1)
        df, labels = data_manip.reformatForML(df, metadata, target)
        threshold = 0.2
        old_f1 = 0.5
        current_features.append(importDf.columns[0])
        for i in range(1, len(importDf.columns) - 1):
            current_features.append(importDf.columns[i])
            train_features, train_labels, test_features, test_labels, _, _ = data_manip.getTrainTestFeatures(df[current_features], labels)
            predictions, test_score, _ = ml.ids("Forest", train_features, train_labels, test_features, test_labels)
            new_f1 = ml.results(test_score, predictions, test_labels)
            cols.append(current_features)
            if new_f1 - old_f1 > threshold:
                current_features.remove(importDf.columns[i])
                score = new_f1 - old_f1 + 0.5
            else:     
                score = new_f1 - old_f1 + 0.5
                old_f1 = new_f1
            f1_scores[importDf.columns[i]] = score
        results_dict["F1Scores"] = f1_scores
        return results_dict

class SingleFeatureEfficacyTest(BaseTest):
    def __init__(self):
        super(SingleFeatureEfficacyTest, self).__init__("Single Feature Efficacy Test",
                                                        "Orders features according to mutual\
information and trains a random forest\
for classification on a single feature.\
Outputs JSON file with F1 score for each feature",
                                                        "Simulation Artefacts")

    def pipeline(self, df, metadata, target):
        """
        Run pipeline.
        """
        f1_scores = {}
        results_dict = {}
        info = metrics.InfoGainMetric() # InfoGain Metric
        importances = info.apply_metric(df, metadata, target) # Get InfoGain for each column
        importDf = pd.DataFrame(importances, index=[0])
        df, labels = data_manip.reformatForML(df, metadata, target)
        for i in range(0, len(importDf.columns)): # Run Random Forest Classifier, trained on each column
            train_features, train_labels, test_features, test_labels, _, _ = data_manip.getTrainTestFeatures(df[[importDf.columns[i]]], labels)
            predictions, test_score, _ = ml.ids("Forest", train_features, train_labels, test_features, test_labels) 
            f1 = ml.results(test_score, predictions, test_labels)
            f1_scores[importDf.columns[i]] = f1
        results_dict["F1Scores"] = f1_scores
        return results_dict

class CorrelationTest(BaseTest):
    def __init__(self):
        super(CorrelationTest, self).__init__("Correlation Test",
                                              "Calculate correlations between\
features (Unused, not useful)",
                                              "Other")

    def pipeline(self, df, metadata, target, rearrange=False, importances=None):
        """
        Run pipeline.
        """
        if rearrange:
            if importances is not None:
                df = utils.rearrange_importance(df=df, importances=importances)
            else:
                df = utils.rearrange_importance(df, metadata, target)
        else:
            df, _ = data_manip.reformatForML(df, metadata, target)
        correlations = df.corr()
        return correlations


class SimpleAdversarialTest(BaseTest):
    def __init__(self):
        super(SimpleAdversarialTest, self).__init__("Unguided Adversarial Test",
                                                    "Adv (Unused, although interesting)",
                                                    "Other")

    def _importances(self, classifier):
        num_feat = min(10, classifier.n_features_in_)
        importances = classifier.feature_importances_
        std = np.std([tree.feature_importances_ for tree in classifier.estimators_],
            axis=0)
        indices = np.argsort(importances)[::-1][:num_feat]
        return importances, std, indices
    
    def _first_run(self, train_features, train_labels, test_features, test_labels):
        scaler = preprocessing.StandardScaler().fit(train_features)

        train_features = scaler.transform(train_features)
        test_features = scaler.transform(test_features)
        predictions, test_score, classifier = ml.ids("Logistic",
                                                    train_features=train_features,
                                                    train_labels=train_labels,
                                                    test_features=test_features,
                                                    test_labels=test_labels)
        ml.results(test_score, predictions, test_labels)
        index_dict = {}
        return classifier, index_dict

    def _run(self, classifier, test_features):
        predictions = classifier.predict(test_features)
        return predictions

    def _adv(self, indices, test_features, test_labels, scale):
        labels = np.where(test_labels == 1)[0]
        for index in indices:
           test_features[labels, index] = test_features[labels, index] * scale,
        test_features = test_features.to_numpy()
        return test_features
    
    def pipeline(self, df, metadata, target_label):
        df, labels = data_manip.reformatForML(df, metadata, str(target_label))
        train_features, train_labels, test_features, test_labels, _, _ = data_manip.getTrainTestFeatures(df, labels)
        classifier, indices = self._first_run(df, train_features, train_labels, test_features, test_labels)
        control_important = []
        for field in metadata['control']:
            if field in indices.keys():
                control_important.append(indices[field])
        for scale in  [1.5, 2, 2.5, 3, 3.5]:
            modified_test_features = self._adv(control_important, test_features, test_labels, scale)
            scaler = preprocessing.StandardScaler().fit(train_features)
            modified_test_features = scaler.transform(modified_test_features)
            predictions = self._run(classifier, modified_test_features, test_labels)
            test_score = np.mean(test_labels == predictions)
            ml.results(test_score, predictions, test_labels)

class TimeBehaviourTest(BaseTest):
    def __init__(self):
        super(TimeBehaviourTest, self).__init__("Time vs Behaviour Plots",
                                                "Plot time vs behaviour time series data",
                                                "Other")
    
    def plot_series(self, df, filename):
        """
        We assume that the CSV is already sorted according to time, so we just need to plot it.
        """
        def _plot_series(df, filename):
            import seaborn as sns
            import matplotlib.pyplot as plt
            fig = sns.lineplot(data=df, x="idx", y="value", hue="variable").get_figure()
            fig.savefig(filename)
            plt.clf()
        return _plot_series(df, filename)


    def pipeline(self, df, metadata, target=None, port=None, remove_outliers=False):
        label_field = metadata["label_field"]
        port_field = metadata["dst_port"]
        destination_bytes = metadata["dst_bytes"]
        source_bytes = metadata["src_bytes"]

        if target == None and port != None:
            trunc_df = df[df[port_field] == port][[destination_bytes, source_bytes]]
        elif target != None and port == None:
            trunc_df = df[df[label_field] == target][[destination_bytes, source_bytes]]
        elif target != None and port != None:
            trunc_df = df[(df[label_field] == target) & (df[port_field] == port)][[destination_bytes, source_bytes]]
        else:
            trunc_df = df[[destination_bytes, source_bytes]]
        if remove_outliers:
            trunc_df = trunc_df[(np.abs(stats.zscore(trunc_df[source_bytes])) < 3)]
            trunc_df = trunc_df[(np.abs(stats.zscore(trunc_df[destination_bytes])) < 3)]

        ordered_source_df = trunc_df.sort_values(source_bytes)
        ordered_destination_df = trunc_df.sort_values(destination_bytes)

        trunc_df["idx"] = [i for i in range(0, trunc_df.shape[0])]
        ordered_source_df["idx"] = [i for i in range(0, ordered_source_df.shape[0])]
        ordered_destination_df["idx"] = [i for i in range(0, ordered_destination_df.shape[0])]

        trunc_df = pd.melt(trunc_df, id_vars=["idx"], value_vars=[destination_bytes, source_bytes])
        ordered_source_df = pd.melt(ordered_source_df, id_vars=["idx"], value_vars=[destination_bytes, source_bytes])
        ordered_destination_df = pd.melt(ordered_destination_df, id_vars=["idx"], value_vars=[destination_bytes, source_bytes])

        self.plot_series(trunc_df, "TimeSeries.pdf")
        self.plot_series(ordered_source_df, "SourceSeries.pdf")
        self.plot_series(ordered_destination_df, "DestinationSeries.pdf")

class CompleteTest(BaseTest):
    def __init__(self):
        super(CompleteTest, self).__init__("Complete", "Run all tests", "Other")
    
    def pipeline(self, df, metadata, target):
        cosine = CosineTest()
        ports = PortTest()
        nn = NearestNeighboursTest()
        sing = SingleFeatureEfficacyTest()

        results_dict = {}

        with utils.Spinner(): 
            print("[!] Running Cosine Test")
            results_dict["CosineTest"] = cosine.pipeline(df, metadata, target, 500)
            print("[!] Running Mislabelled Ports Test")
            results_dict["MislabelPortsTest"] = ports.pipeline(df, metadata, target)
            print("[!] Running Mislabelled Test")
            results_dict["MislabelTest"] = nn.pipeline(df, metadata, target, 500)
            print("[!] Running Importances Test")
            results_dict["SingleFeatureEfficacy"] = sing.pipeline(df, metadata, target)

        return results_dict