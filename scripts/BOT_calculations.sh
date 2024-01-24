#!/bin/bash

# DDoS

#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DDoS --folder --csv data/BOT/  --test CosineTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DDoS --folder --csv data/BOT/  --test PortTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DDoS --folder --csv data/BOT/  --test SingleFeatureEfficacyTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DDoS --folder --csv data/BOT/  --test NearestNeighboursTest

# DoS

#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DoS --folder --csv data/BOT/  --test CosineTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DoS --folder --csv data/BOT/  --test PortTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DoS --folder --csv data/BOT/  --test SingleFeatureEfficacyTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target DoS --folder --csv data/BOT/  --test NearestNeighboursTest

# Reconnaissance

python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Reconnaissance --folder --csv data/BOT/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Reconnaissance --folder --csv data/BOT/  --test PortTest
python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Reconnaissance --folder --csv data/BOT/  --test SingleFeatureEfficacyTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Reconnaissance --folder --csv data/BOT/  --test NearestNeighboursTest

# Theft

python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Theft --folder --csv data/BOT/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Theft --folder --csv data/BOT/  --test PortTest
python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Theft --folder --csv data/BOT/  --test SingleFeatureEfficacyTest
#python3 ./src/netstats.py --metadata metadata/bot/metadata.json --results results/BOT/ --target Theft --folder --csv data/BOT/  --test NearestNeighboursTest
