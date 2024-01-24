import numpy as np
from scipy.io import loadmat  # this is the SciPy module that loads mat-files
import matplotlib.pyplot as plt
from datetime import datetime, date, time
import pandas as pd

mat = loadmat('data/example/cardio/orig/cardio.mat')  # load mat-file

df = pd.DataFrame(mat["X"])

df["label"] = mat['y']

print(df.head())

df.to_csv('data/example/cardio/csv/cardio.csv', index=False, header=True)