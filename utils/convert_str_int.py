import pandas as pd
df = pd.read_csv('data/example/MNIST/mnist_test.csv')
df['label'] = df['label'].apply(str)
df.to_csv("data/example/MNIST/mnist_str_test.csv", header=True, index=False)