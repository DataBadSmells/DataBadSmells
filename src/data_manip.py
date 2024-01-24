import pandas as pd
import numpy as np
import os, glob
import json
from sklearn import preprocessing

from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split

import utils

def readFile(_file: str, metadata: dict):
    label_field = metadata["label_field"]
    port_field = metadata["dst_port"]
    df = pd.read_csv(_file)
    df[port_field] = pd.to_numeric(df[port_field], errors="coerce")
    df = df.dropna(subset=[port_field])
    df[port_field] = df[port_field].astype(int)
    df[label_field] = df[label_field].astype(str)
    df[label_field] = df[label_field].str.strip()
    df = df.drop_duplicates()
    #### Just for ICSX ####
    #df = df.drop(df[((df['totalSourceBytes'] % 64) == 0) & ((df['totalDestinationBytes'] % 64) == 0)].index)
    #df = df.drop(df[(df["Tag"] != "Attack") & (df["totalDestinationBytes"] == 163972)].index)
    return df

def readDirec(_path: str, metadata: dict):
    dfs = []    
    for filename in glob.glob(os.path.join(_path, '*.csv')):
        print(f"[*] Loading file {filename}")
        dfs.append(readFile(filename, metadata))
    print("[*] Concatenating files")
    return pd.concat(dfs, ignore_index=True)

def saveMetadata(_file: str, drop_fields: list, unique_fields:list, label_field: str, benign_label: str, dst_port:str, ignore_ports: list):
    metadata = {}
    metadata['drop_fields'] = drop_fields
    metadata['unique_fields'] = unique_fields
    metadata['label_field'] = label_field
    metadata['benign_label'] = benign_label
    metadata['dst_port'] = dst_port
    metadata['ignore_ports'] = ignore_ports

    with open(_file, 'w') as md:
        json.dump(metadata, md)

def readMetadata(_file: str):
    with open(_file, 'r') as md:
        return json.load(md)


def _reformatForML(df: pd.DataFrame, drop_fields: list, unique_fields: list, label_field: str, benign_label:str,  target: str):
    """
    Reformat DataFrame for Machine Learning algorithms
    """
    print("[*] Reformating for ML")
    print("[*] Dropping Drop Fields")
    df = df.drop(drop_fields, axis=1)
    print("[*] Dropping and replacing NaNs/Infs")
    df = df.replace(np.inf, np.nan)
    df = df.dropna()
    print("[*] Saving and dropping Label Field")
    labels = df[label_field]
    df = df.drop(label_field, axis=1)
    if benign_label == None:
        labels.loc[(labels != target)] = 'Other'
        label_mapping = {"Other": 0,
                        target: 1}
    else:
        print("[*] Building label mapping")
        label_index = labels.loc[((labels != benign_label) & (labels != target))].index
        labels = labels.drop(label_index)
        df = df[~df.index.isin(label_index)]
        label_mapping = {benign_label: 0,
                        target: 1}
    print("[*] Instantiating label mapping")
    labels = labels.replace(label_mapping)
    print("[*] Dealing with unique fields")
    if unique_fields is not None:
        for field in unique_fields:
            unique_field = df[field].unique()
            field_mapping = dict(zip(unique_field, range(len(unique_field))))
            df = df.replace({field: field_mapping})
    return df, labels


def reformatForML(df: pd.DataFrame, metadata: dict, target: str):
    """
    Reformat DataFrame for Machine Learning algorithms
    """
    df, labels = _reformatForML(df, metadata["drop_fields"], metadata["unique_fields"], metadata["label_field"], metadata["benign_label"], target)
    return df, labels

def reformatForClustering(df, metadata, targets):
    print("[*] Reformating for Clustering")
    drop_labels = metadata["drop_fields"]
    label_field = metadata["label_field"]
    unique_fields = metadata["unique_fields"]
    print("[*] Calculating Majority and Minority Classes")
    df_minority = df[df[metadata["label_field"]] == targets[1]]
    df_majority = df[df[metadata["label_field"]] == metadata["benign_label"]]
    del df
    df = pd.concat([df_minority, df_majority])
    if len(targets) == 1:
        print("[*] Building label mapping")
        df[label_field].loc[(df[label_field] != targets[0])] = 'Other'
        label_mapping = {"Other": "0",
                        targets[0]: "1"}
        print("[*] Instantiating label mapping")
        df[label_field] = df[label_field].replace(label_mapping)
        targets.append("0")
    print("[*] Dropping Drop Fields")
    df = df.loc[df[label_field].isin(targets), :]
    df = df.drop(drop_labels, axis=1)
    print("[*] Dropping and replacing NaNs/Infs")
    df = df.replace(np.inf, np.nan)
    df = df.dropna()
    if unique_fields is not None:
        for field in unique_fields:
            print("Enumerating field: {}".format(field))
            unique_field = df[field].unique()
            field_mapping = dict(zip(unique_field, range(len(unique_field))))
            df = df.replace({field: field_mapping})
    print("[*] MinMaScaling")
    scaler = MinMaxScaler()
    scaler.fit(df.loc[:,df.columns != label_field])
    df.loc[:,df.columns != label_field] = scaler.transform(df.loc[:,df.columns != label_field])
    print("[*] Saving and dropping Label Field")
    labels = df[label_field]
    df = df.drop(label_field, axis=1)
    print("Preprocessed!")
    return df, labels

def reformatForDiv(df=None, metadata=None):
    """
    Reformat DataFrame for divergence metrics.
    """
    data = df.replace([np.inf, -np.inf], np.nan)
    data = data.dropna()
    data  = data.drop(metadata["drop_fields"], axis=1)
    if metadata['unique_fields'] is not None:
        for field in metadata['unique_fields']:
            unique_field = data[field].unique()
            field_mapping = dict(zip(unique_field, range(len(unique_field))))
            data = data.replace({field: field_mapping})
    return data

def reformatForCosine(df, metadata, target, sample=0.5):
    print("[*] Reformating for Clustering")
    print("[*] DF shape before dropping NaNs: ", df.shape)
    print(f"[*] Sampling frac={sample}")
    data = df.sample(frac=sample)
    print("[*] Dropping Drop Fields")
    data = data.drop(metadata["drop_fields"], axis=1)
    print("[*] Dealing with unique fields")
    if metadata['unique_fields'] is not None:
        for field in metadata['unique_fields']:
            print(f"[*] Looking at field {field}")
            unique_field = data[field].unique()
            field_mapping = dict(zip(unique_field, range(len(unique_field))))
            data = data.replace({field: field_mapping})
    print("[*] Dropping Label Field")
    data = data[data[metadata["label_field"]] == target]
    data = data.drop(metadata["label_field"], axis=1)
    print("[*] MinMax Scaling")
    data = (data - data.min())/(data.max() - data.min())
    print("[*] Dropping Fixed Value Columns")
    for col in data.columns:
        if data[col].isnull().all():
            data = data.drop([col], axis=1)
    print("[*] Dropping and replacing NaNs/Infs")
    data = data.replace(np.inf, pd.NA).dropna()
    print("[*] Finished Reformating for Cosine Similarity")
    return data

def getTrainTestFeatures(df: pd.DataFrame, labels: pd.Series):
    indices = np.arange(df.shape[0])
    train_features, test_features, train_labels, test_labels, train_indices, test_indices = train_test_split(df, labels, indices, test_size=0.2, random_state=100)

    train_labels = utils.removeInfinite(train_labels, train_features)
    train_features = utils.removeInfinite(train_features, train_features)

    test_labels = utils.removeInfinite(test_labels, test_features)
    test_features = utils.removeInfinite(test_features, test_features)

    return train_features, train_labels, test_features, test_labels, train_indices, test_indices