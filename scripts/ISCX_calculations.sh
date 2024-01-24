#!/bin/bash

# Attack

python3 ./src/netstats.py --metadata metadata/ISCX/metadata.json --results results/ISCX_results_redux/ --target Attack --folder --csv data/ISCX_preprocessed_label_full/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadata.json --results results/ISCX_results_redux/ --target Attack --folder --csv data/ISCX_preprocessed_label_full/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadata.json --results results/ISCX_results_redux/ --target Attack --folder --csv data/ISCX_preprocessed_label_full/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadata.json --results results/ISCX_results_redux/ --target Attack --folder --csv data/ISCX_preprocessed_label_full/  --test SingleFeatureEfficacyTest

# HTTPWeb

python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_HTTPWeb --folder --csv data/ISCX_preprocessed_label_full_64/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_HTTPWeb --folder --csv data/ISCX_preprocessed_label_full/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_HTTPWeb --folder --csv data/ISCX_preprocessed_label_full/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_HTTPWeb --folder --csv data/ISCX_preprocessed_label_full/  --test SingleFeatureEfficacyTest

# IRC
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_IRC --folder --csv data/ISCX_preprocessed_label_full_64/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_IRC --folder --csv data/ISCX_preprocessed_label_full/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_IRC --folder --csv data/ISCX_preprocessed_label_full/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_IRC --folder --csv data/ISCX_preprocessed_label_full_64/  --test SingleFeatureEfficacyTest

# nmap
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_nmap --folder --csv data/ISCX_preprocessed_label_full_64/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_nmap --folder --csv data/ISCX_preprocessed_label_full_64/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_nmap --folder --csv data/ISCX_preprocessed_label_full_64/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_nmap --folder --csv data/ISCX_preprocessed_label_full_64/  --test SingleFeatureEfficacyTest

# SSH

python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_SSH --folder --csv data/ISCX_preprocessed_label_full_64/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_SSH --folder --csv data/ISCX_preprocessed_label_full/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_SSH --folder --csv data/ISCX_preprocessed_label_full/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagApp.json --results results/ISCX_results_redux/ --target Attack_SSH --folder --csv data/ISCX_preprocessed_label_full_64/  --test SingleFeatureEfficacyTest

# Other

python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagAppReduced.json --results results/ISCX_results_redux/ --target Attack_Other --folder --csv data/ISCX_preprocessed_label_full_64_reduced/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagAppReduced.json --results results/ISCX_results_redux/ --target Attack_Other --folder --csv data/ISCX_preprocessed_label_full_64_reduced/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagAppReduced.json --results results/ISCX_results_redux/ --target Attack_Other --folder --csv data/ISCX_preprocessed_label_full_64_reduced/  --test NearestNeighboursTest
python3 ./src/netstats.py --metadata metadata/ISCX/metadataTagAppReduced.json --results results/ISCX_results_redux/ --target Attack_Other --folder --csv data/ISCX_preprocessed_label_full_64_reduced/  --test SingleFeatureEfficacyTest
