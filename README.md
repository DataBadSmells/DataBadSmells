## Basic Information

This is a tool designed for auditing the issues with network data, based on their flows. **This tool can be used to run a series of tests on network data: these are the CosineTest, PortTest, SingleFeatureEfficacyTest and NearwestNeighboursTest, detailed below. We have provided a subset of CIC IDS 18 to run these tests, in zipped format, in the `data/` directory.** The tool assumes that the provided dataset file is a CSV of comma separated flow statistics alongside a label field. Many of the tests are comparative, requiring some sensible baseline to evaluate the complexity of a given subset of the dataset. In the case of network intrusion data, the label field may be the attack labels and the baseline traffic may be the benign data.

## Requirements

Start a fresh Python3 virtual environment:

`python -m venv ~/[ENV_NAME]`

Activate the virtual environment:

`source ~/[ENV_NAME]/bin/activate`

Then simply install the requirements found in the `requirements.txt` file:

`pip install -r requirements.txt`

## Data

We've included a small sample of *CIC IDS 2018* to run our tests on. Other datasets need to be downloaded from their respective sources.

We've run this tool on, and provide metadata files, for the following datasets:

- [UNSW NB15](https://research.unsw.edu.au/projects/unsw-nb15-dataset)
- [CIC IDS 2017](https://www.unb.ca/cic/datasets/ids-2017.html)
- [CSE-CIC IDS 2018](https://www.unb.ca/cic/datasets/ids-2018.html)
- [ISCX 2012](https://www.unb.ca/cic/datasets/ids.html)
- [TON IoT](https://research.unsw.edu.au/projects/toniot-datasets)
- [Bot IoT](https://research.unsw.edu.au/projects/bot-iot-dataset)
- [CTU 13](https://www.stratosphereips.org/datasets-ctu13)
- [ODDS](https://odds.cs.stonybrook.edu/)


## Example Commands#

(NB: see 'Data' section above. These commands will only work if the necessary data is downloaded and provided correctly. We've included a small sample of *CIC IDS 2018* to run our tests on, but this must be extracted from the provided zip file in the `data/` directory!)

- **Metric**: `python3 src/netstats.py --metadata metadata/cic2018/metadata.json --target Bot  --results results/CIC18_trunc/ --folder --csv data/CIC18_trunc/ --metric KLDivergence`
- **Test**: `python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target FTP-BruteForce --folder --csv data/CIC18_trunc/  --test CosineTest`

A list of valid options for the `--metric` and `--test` flags can be found in the *Metrics* and *Tests* sections below.

Our heuristics tests can be batch run for each dataset via the files in the `scripts/` folder.

- **Batch Tests**: `./scripts/CIC18_trunc_calculations.sh`

## Other

We provide other files necessary to recreate our experimentation/metric calculation can be found in `nb/`. More details can be found in the README in `nb/`

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
* Nearest Neighbours Test: Percentage of flows that are misclassified according to the Edited Nearest Neighbours criteria. Outputs single result in range $[0,1]$
* Single Feature Efficacy Test: Considers only a single feature to train our random forest. Outputs JSON file with F1 score for each feature.
* Rolling Importances Test: Order features according to mutual information, measure efficacy of 5 features together for classification using random forest. Outputs JSON file with F1 score for each group of 5 features - **Unused/Untested**
* Backwards Packets Test: Percentage of flows with no backwards packets to total flows. Outputs single result in range $[0,1]$ - **Unused/Untested**
* Siamese Network: Measure rate of F1 gain of a few-shot learning siamese network - **Unused/Untested**

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
