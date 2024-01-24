import pandas as pd


in_csv = 'data/CIC/Tuesday-WorkingHours.csv'
size = 46000

with pd.read_csv(in_csv, chunksize=size) as reader:
    for i,chunk in enumerate(reader):
        chunk.to_csv(f'data/example/Tuesday_CIC_{i}.csv', index=False, header=True)