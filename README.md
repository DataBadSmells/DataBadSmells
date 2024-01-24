## Basic Information

This is a tool designed for auditing the complexity of network data. The tool assumes that the provided dataset file is a CSV of comma separated flow statistics alongside a label field. Many of the tests are comparative, requiring some sensible baseline to evaluate the complexity of a given subset of the dataset. In the case of network intrusion data, the label field may be the attack labels and the baseline traffic may be the benign data.

## Metadata Format

Metadata assumes dataset file is comma-separated CSV with labelled columns. Metadata format is JSON.

* drop_fields: list of string - drop the named columns
* unique_fields: list of string - enumerate items in named columns
* label_field: string - name of target label column
* benign_label: string - label used for benign flows
* dst_port: string - name of destination port column
* ignore_ports: list of int - list of destination ports to consider as background traffic

## Tests

* Cosine Test: Approximate cluster size and ratio of identical flows. Outputs one result for each. Both in range $[0,1]$
* Port Test: Percentage of background flows to benign flows, based off of ignore_ports ports. Outputs single result in range $[0,1]$
* Backwards Packets Test: Percentage of flows with no backwards packets to total flows. Outputs single result in range $[0,1]$
* Nearest Neighbours Test: Percentage of flows that are misclassified according to the Edited Nearest Neighbours criteria. Outputs single result in range $[0,1]$
* Rolling Importances Test: Order features according to mutual information, measure efficacy of 5 features together for classification using random forest. Outputs JSON file with F1 score for each group of 5 features
* Single Feature Efficacy Test: Same as above, but considering only a single feature to train our random forest. Outputs JSON file with F1 score for each feature.
* Siamese Network: Measure rate of F1 gain of a few-shot learning siamese network

## Metrics

* Gini Impurity
* Info Gain
* Entropy
* Normalised Entropy

## Distances

* KL Divergence
* JS Divergence
* KS Test
* KS Test (via KDE Estimate)
* EM Distance

## Example Command

python3 src/netstats.py --metadata metadata/cic/metadata.json --target PortScan  --results results/CIC/ --folder --csv data/CIC/ --metric KLDivergence


