import math

import numpy as np
from scipy.stats import entropy, kde, wasserstein_distance
from scipy.spatial.distance import jensenshannon
import scipy.special as sp
from sklearn.feature_selection import mutual_info_classif
import data_manip

class BaseMetric():
    def __init__(self, name, description, metric_type):
        self.metric_name = name
        self.metric_description = description
        self.metric_type = metric_type

    def apply_metric(self):
        pass

class GiniImpurityMetric(BaseMetric):
    def __init__(self):
        super(GiniImpurityMetric, self).__init__("Gini Impurity", "Calculates the Gini Impurity of a target label", "Metric")

    def apply_metric(self, data, metadata, target):
        label_field = metadata["label_field"]
        denom = data.shape[0]
        gini_data = data[(data[label_field] == target) | (data[label_field] == metadata["benign_label"])]
        sum = 0
        for label in gini_data[label_field].unique().tolist():
            sum += math.pow((gini_data[gini_data[label_field] == label].shape[0] / denom), 2)
        return 1 - sum

class InfoGainMetric(BaseMetric):
    def __init__(self):
        super(InfoGainMetric, self).__init__("Information Gain", "Calculates the info gain of all features for classification between target label and benign label", "Divergence")

    def apply_metric(self, data, metadata, target):
        #print(data.columns)
        df, labels = data_manip.reformatForML(data, metadata, target)
        _, _, test_features, test_labels, _, _ = data_manip.getTrainTestFeatures(df, labels)
        importances = dict(zip(df.columns, mutual_info_classif(test_features, test_labels)))
        return {k: v for k, v in sorted(importances.items(), key=lambda item: item[1])}

class EntropyMetric(BaseMetric):
    def __init__(self):
        super(EntropyMetric, self).__init__("Shannon Entopy", "Calculates Shannon Entropy of across all columnss.", "Metric")
    
    def apply_metric(self, data):
        probs = data.value_counts() / data.value_counts().sum()
        return entropy(probs, base=2)

class NormalisedEntropyMetric(BaseMetric):
    def __init__(self):
        super(NormalisedEntropyMetric, self).__init__("Normalised Shannon Entropy", "Calculates Normalised Shannon Entropy of a given column.", "Metric")

    def apply_metric(self, data):
        probs = data.value_counts() / data.value_counts().sum()
        ent = entropy(probs, base=2)
        den = math.log(data.value_counts().shape[0], 2)
        if den == 0:
            return 0
        else:
            return (ent / den)

class KLDivergence(BaseMetric):
    def __init__(self):
        super(KLDivergence, self).__init__("KL Diveregence", "Calculates the KL Divergence between two columns.", "Divergence")

    def _kl_div(self, xs, p1, p2):
        with np.errstate(divide='ignore', invalid='ignore'):
            kl = p1 * (np.log(p1) - np.log(p2))
        kl[~np.isfinite(kl)] = 0
        return np.trapz(kl, x=xs)

    def apply_metric(self, data1, data2, num_points = 100):
        try:
            print("\t[*] Sampling Points")
            xs, p1, p2 = get_points(data1, data2, num_points)
            #score = self._kl_div(xs, p1, p2)
            print("\t[*] Calculating Entropy")
            score = entropy(p1, p2)
        except Exception as e:
            print("\t[!] Error: Singular Matrix or Missing Class")
            score = None
        return score

class JSDivergence(BaseMetric):
    def __init__(self):
        super(JSDivergence, self).__init__("JS Divergence", "Calculates the JS Divergence between two columns.", "Divergence")
    
    def _kl_div(self, xs, p1, p2):
        with np.errstate(divide='ignore', invalid='ignore'):
            kl = p1 * (np.log(p1) - np.log(p2))
        kl[~np.isfinite(kl)] = 0
        return np.trapz(kl, x=xs)

    def apply_metric(self, data1, data2, num_points=100):
        try:
            xs, p1, p2 = get_points(data1, data2, num_points)
            score = jensenshannon(p1, p2)
        except:
            score = None
        return score

class KSTestDivergence(BaseMetric):
    def __init__(self):
        super(KSTestDivergence, self).__init__("KS Test", "Performs the KS Test between two columns.", "Divergence")

    def apply_metric(self, data1, data2):
        x1 = np.sort(data1)
        x2 = np.sort(data2)
        x = np.sort(np.concatenate([x1, x2]))
        y1 = np.linspace(0, 1, len(x1)+1)[1:]
        y2 = np.linspace(0, 1, len(x2)+1)[1:]
        cdf1 = np.interp(x, x1, y1, left=0)
        cdf2 = np.interp(x, x2, y2, left=0)
        return abs(cdf1-cdf2).max()

class KSTestKDEDivergence(BaseMetric):
    def __init__(self):
        super(KSTestKDEDivergence, self).__init__("KS Test KDE", "Performs the KS Test between two columns, using a KDE as intermediary estimate.", "Divergence")
        
    def apply_metric(self, data1, data2, num_points=100):
        xs, kd1, kd2 = kde_estimates(data1, data2, num_points)
        with np.errstate(under='ignore'):
            cdf1 = np.array([kd1.integrate_box_1d(-np.inf, x) for x in xs])
            cdf2 = np.array([kd2.integrate_box_1d(-np.inf, x) for x in xs])
        return abs(cdf1 - cdf2).max()

class EarthMoversDivergence(BaseMetric):
    def __init__(self):
        super(EarthMoversDivergence, self).__init__("Earth Mover's Distance", "Calculates the Earth Mover's Distance between two columns.", "Divergence")

    def apply_metric(self, data1, data2, num_points=100):
        try:
            xs, p1, p2 = get_points(data1, data2, num_points)
            score = wasserstein_distance(p1, p2)
        except:
            score = None
        return score

class CompleteMetric(BaseMetric):
    def __init__(self):
        super(CompleteMetric, self).__init__("Complete Metrics", "Run all metrics on dataset", "Metric")

    def apply_metric(self, data, metadata, target):
        label_field = metadata["label_field"]
        
        results = {}

        gi = GiniImpurityMetric()
        results_gi = []
        ig = InfoGainMetric()
        results_ig = []
        en = EntropyMetric()
        results_en = []
        ne = NormalisedEntropyMetric()
        results_ne = []

        df = data_manip.reformatForDiv(data, metadata)

        df1 = df[df[label_field] == target]

        for col in df.columns:
            if col == metadata["label_field"]:
                continue
            results_gi.append(gi.apply_metric(df[[col, label_field]], metadata))
            results_en.append(en.apply_metric(df1[col]))
            results_ne.append(ne.apply_metric(df1[col]))

        results_ig.append(ig.apply_metric(data, metadata, target)) # This could definitely be more efficient as we are reformting the data twice

        results["GiniImpurity"] = dict(zip(df.columns, results_gi))
        results["Entropy"] = dict(zip(df.columns, results_en))
        results["NormalisedEntropy"] = dict(zip(df.columns, results_ne))
        results["InfoGain"] = results_ig

        return results


class CompleteDivergence(BaseMetric):
    def __init__(self):
        super(CompleteDivergence, self).__init__("Complete Divergence", "Run all divergence metrics", "Divergence")

    def apply_metric(self, data, metadata, target1, target2, num_points=100):
        label_field = metadata["label_field"]
        data = data_manip.reformatForDiv(data, metadata)
        results = {}

        kl_div = KLDivergence()
        kl_results = []
        js_div = JSDivergence()
        js_results = []
        ks_div = KSTestDivergence()
        ks_results = []
        em_div = EarthMoversDivergence()
        em_results = []

        data1 = data[data[label_field] == target1]
        data2 = data[data[label_field] == target2]

        data1 = data1.drop(label_field, axis=1)
        data2 = data2.drop(label_field, axis=1)

        for col in data1.columns:
            kl_results.append(kl_div.apply_metric(data1[col], data2[col], num_points))
            js_results.append(js_div.apply_metric(data1[col], data2[col], num_points))
            ks_results.append(ks_div.apply_metric(data1[col], data2[col]))
            em_results.append(em_div.apply_metric(data1[col], data2[col], num_points))

        results["KLDivergence"] = dict(zip(data1.columns, kl_results))
        results["JSDivergence"] = dict(zip(data1.columns, js_results))
        results["KSTest"] = dict(zip(data1.columns, ks_results))
        results["EMDistance"] = dict(zip(data1.columns, em_results))

        return results
        
        


def kde_estimate(data, num_points):
    data = np.asarray(data, dtype=np.float64)
    kd_estimator = kde.gaussian_kde(data, bw_method="silverman")
    data_samples = kd_estimator.resample(num_points//2)[0]
    xs = np.sort(data_samples)
    return kd_estimator, xs

def kde_estimates(data1, data2, num_points):
    if num_points is None:
        num_points = min(5000, len(data1) + len(data2)//2)
    kd1, xs1 = kde_estimate(data1, num_points)
    kd2, xs2 = kde_estimate(data2, num_points)
    
    xs = np.sort(np.concatenate([xs1, xs2]))
    return xs, kd1, kd2

def _get_points(data, num_points):
    kd, xs = kde_estimate(data, num_points)
    with np.errstate(under='ignore'):
        p = kd(xs)
    return xs, p

def get_points(data1, data2, num_points):
    xs, kd1, kd2 = kde_estimates(data1, data2, num_points)
    with np.errstate(under='ignore'):
        p1 = kd1(xs)
        p2 = kd2(xs)
    return xs, p1, p2


def _applyMetric(data, func):
    return func(data)

def applyMetric(df, func):
    metric_results = list()
    for col in df.columns:
        metric_results.append(_applyMetric(df[col], func))
    return metric_results
    
def applyMetricToAttack(df, func, metadata, attack):
    df = df[df[metadata['label_field']] == attack]
    return applyMetric(df, func)

def _applyDiv(data1, data2, func):
    return func(data1, data2)

def applyDiv(data1, data2, func):
    div_results = list()
    for col in data1.columns:
        div_results.append(_applyDiv(data1[col], data2[col], func))
    return div_results

def applyDivToAttack(df, func, metadata, attack):
    data1 = df[df[metadata['label_field']] == attack]
    data2 = df[df[metadata['label_field']] == metadata['benign_label']]
    return applyDiv(data1, data2, func)

