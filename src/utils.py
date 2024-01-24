import sys
import time
import threading

import numpy as np
from sklearn.cluster import KMeans
from yellowbrick.cluster import KElbowVisualizer

import metrics

def removeInfinite(features1, features2):
    return features1[np.isfinite(features2).all(1)]

def calculateElbowValue(data):
    """
    Calculate the Elbow Value of a data, which
    we use a reasonable, fast approximation of
    the number of clusters in a dataset.
    """
    model = KMeans()
    visualizer = KElbowVisualizer(model, k=(1,8))
    visualizer.fit(data)
    #visualizer.show()
    return visualizer.elbow_value_

def reject_outliers(data, m = 2):
    """
    Drop any rows with columns that have outlier values.
    Any value that is >m standard deviations from the mean
    is considered an outlier.
    """
    d = np.abs(data - np.median(data))
    mdev = np.median(d)
    s = d/mdev if mdev else 0.
    return data[s<m]

def unique_values(data):
    """
    Convert unqiue categorical features to positive integers.
    """
    unique_field = data.unique()
    field_mapping = dict(zip(unique_field, range(len(unique_field))))
    data = data.replace(field_mapping)
    return data

def get_ordered_unique_values(data):
    """
    Get unqiue values in order of frequency.
    """

    data_value_counts = data.value_counts()
    data_list = data_value_counts.index.tolist()
    data_value_list = data_value_counts.values.tolist()

    return data_list, data_value_list

def rearrange_importance(df, metadata=None, target=None, importances=None):
    """
    Approximate feature importance (via InfoGain) and rearrange
    the features in increasing (approximate) importance.
    """
    if importances == None:
        info = metrics.InfoGainMetric()
        importances = info.apply_metric(df, metadata, target)
    cols = importances.keys()
    return df[cols]

def check_json(json):
    if "TimeBehaviourTest" in json.keys():
        return True
    return False
