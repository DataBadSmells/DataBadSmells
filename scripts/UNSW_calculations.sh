#!/bin/bash

# Generic

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Generic --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Generic --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Generic --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Generic --folder --csv data/UNSW/  --test NearestNeighboursTest

# Exploits

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Exploits --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Exploits --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Exploits --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Exploits --folder --csv data/UNSW/  --test NearestNeighboursTest

# Fuzzers

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Fuzzers --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Fuzzers --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Fuzzers --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Fuzzers --folder --csv data/UNSW/  --test NearestNeighboursTest

# DoS

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target DoS --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target DoS --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target DoS --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target DoS --folder --csv data/UNSW/  --test NearestNeighboursTest

# Reconnaissance

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Reconnaissance --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Reconnaissance --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Reconnaissance --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Reconnaissance --folder --csv data/UNSW/  --test NearestNeighboursTest

# Analysis

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Analysis --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Analysis --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Analysis --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Analysis --folder --csv data/UNSW/  --test NearestNeighboursTest

# Backdoor/Backdoors

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Backdoor --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Backdoor --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Backdoor --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Backdoor --folder --csv data/UNSW/  --test NearestNeighboursTest

# Shellcode

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Shellcode --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Shellcode --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Shellcode --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Shellcode --folder --csv data/UNSW/  --test NearestNeighboursTest

# Worms

python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Worms --folder --csv data/UNSW/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Worms --folder --csv data/UNSW/  --test PortTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Worms --folder --csv data/UNSW/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/unsw/metadata.json --results results/UNSW/ --target Worms --folder --csv data/UNSW/  --test NearestNeighboursTest
