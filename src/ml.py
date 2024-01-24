import data_manip

import numpy as np
import pandas as pd
import os

from sklearn.cluster import KMeans
from sklearn.svm import LinearSVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import NearestNeighbors
from sklearn.linear_model import LogisticRegression
from sklearn import tree
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import confusion_matrix, f1_score
import matplotlib.pyplot as plt

def ids(mode=None, train_features=None, train_labels=None, test_features=None, test_labels=None):
    """
    Just a big old switch for choosing a specific ML algorithm
    """
    if mode == 'Forest':
        classifier = RandomForestClassifier(n_estimators = 20, random_state = 100)
        print("Classifier Initialised")
        classifier.fit(train_features, train_labels)
        print("Classifier Trained")
        predictions  = classifier.predict(test_features)
    elif mode == 'DT':
        classifier = tree.DecisionTreeClassifier()
        print("Classifier Initialised")
        classifier.fit(train_features, train_labels)
        print("Classifier Trained")
        predictions  = classifier.predict(test_features)
    elif mode == 'Logistic':
        classifier = LogisticRegression()
        print("Classifier Initialised")
        classifier.fit(train_features, train_labels)
        print("Classifier Trained")
        predictions  = classifier.predict(test_features)
    elif mode == 'SVC':
        classifier = LinearSVC()
        print("Classifier Initialised")
        classifier.fit(train_features, train_labels)
        print("Classifier Trained")
        predictions  = classifier.predict(test_features)
    elif mode == 'MLP':
        classifier = MLPClassifier(random_state = 100, hidden_layer_sizes=(5,))
        print("Classifier Initialised")
        classifier.fit(train_features, train_labels)
        print("Classifier Trained")
        predictions = classifier.predict(test_features)
    else:
        print('Choose valid mode.')

    test_score = np.mean(test_labels == predictions)
    return predictions, test_score, classifier


def basicFeatureImportance(df, classifier, name, target_label, _direc):
    """
    Dump feature importances to a directory (or do nothing, if
    algorithm does not support simple Feature Importance
    mechanisms)
    """
    importance_file = os.path.join(_direc, target_label + '_importances.txt')
    importance_graph = os.path.join(_direc, target_label + '_importances.pdf')
    if name == "Forest":
        num_feat = min(10, classifier.n_features_in_)
        importances = classifier.feature_importances_
        std = np.std([tree.feature_importances_ for tree in classifier.estimators_],
            axis=0)
        indices = np.argsort(importances)[::-1][:num_feat]
        
        with open(importance_file, 'w') as f:
            for feat in range(num_feat):
                write_string = "Feature {ind}: {cols} {importance}\n".format(
                    ind=indices[feat], cols=df.columns.values[indices[feat]], importance=importances[indices[feat]])
                f.write(write_string)
        plt.figure()
        plt.title("Feature Importances")
        plt.bar(range(num_feat), importances[indices],
            color='r', yerr=std[indices], align="center")
        plt.xticks(range(num_feat), indices)
        plt.xlim([-1, num_feat])
        plt.savefig(importance_graph)

def results(test_score, predictions, test_labels):
    """
    Print results of ML Classifier
    """
    print("Test Score: ", test_score)
    print(confusion_matrix(test_labels.values, predictions))
    print("F1 Score: ", f1_score(test_labels.values, predictions, average='macro'))
    return f1_score(test_labels.values, predictions, average='macro')

def mlPipeline(df, metadata, target_label, name="Forest", _direc='results', verbose=True):
    """
    Pipeline for running ML process
    """
    df, labels = data_manip.reformatForML(df, metadata, target_label)
    train_features, train_labels, test_features, test_labels, _, test_indices = data_manip.getTrainTestFeatures(df, labels)
    predictions, test_score, classifier = ids(name, 
                                            train_features=train_features,
                                            train_labels=train_labels,
                                            test_features=test_features,
                                            test_labels=test_labels)
    if verbose:
        results(test_score=test_score, predictions=predictions, test_labels=test_labels)
        labels = np.where(test_labels != predictions)[0]
        print(test_indices[labels])
        print(df.iloc[test_indices[labels]].head(50))
    basicFeatureImportance(df, classifier, name, target_label, _direc)

def calculateClusters(data, n_clusters):
    """
    Perform KMeans on data and add column describing which cluster
    each row belongs to
    """
    kmeans = KMeans(n_clusters = n_clusters)
    kmeans.fit(data)
    clusters = pd.DataFrame({'Cluster': kmeans.labels_})
    data = data.reset_index(drop=True)
    data = data.join(clusters)
    print("[*] Clusters Calculated")

    return data, kmeans.cluster_centers_

def nn(df):
    """
    Apply Nearest Neighbours to dataset
    """
    nbrs = NearestNeighbors(n_neighbors=2, algorithm='auto', metric='manhattan', n_jobs=-1).fit(df)
    distances, indices = nbrs.kneighbors(df)
    return distances, indices

