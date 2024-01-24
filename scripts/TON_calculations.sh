#!/bin/bash

# scanning

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target scanning --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target scanning --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target scanning --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target scanning --folder --csv data/TON/  --test NearestNeighboursTest

# dos

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target dos --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target dos --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target dos --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target dos --folder --csv data/TON/  --test NearestNeighboursTest

# ddos

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ddos --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ddos --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ddos --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ddos --folder --csv data/TON/  --test NearestNeighboursTest

# injection

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target injection --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target injection --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target injection --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target injection --folder --csv data/TON/  --test NearestNeighboursTest

# password

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target password --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target password --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target password --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target password --folder --csv data/TON/  --test NearestNeighboursTest

# xss

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target xss --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target xss --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target xss --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target xss --folder --csv data/TON/  --test NearestNeighboursTest

# ransomware

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ransomware --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ransomware --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ransomware --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target ransomware --folder --csv data/TON/  --test NearestNeighboursTest

# mitm

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target mitm --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target mitm --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target mitm --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target mitm --folder --csv data/TON/  --test NearestNeighboursTest

# backdoor

python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target backdoor --folder --csv data/TON/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target backdoor --folder --csv data/TON/  --test PortTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target backdoor --folder --csv data/TON/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/ton/metadata.json --results results/TON/ --target backdoor --folder --csv data/TON/  --test NearestNeighboursTest