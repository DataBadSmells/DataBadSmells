#!/bin/bash

# DoS Hulk

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Hulk --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Hulk --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Hulk --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Hulk --folder --csv data/CIC/  --test NearestNeighboursTest

# DDoS

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DDoS --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DDoS --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DDoS --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DDoS --folder --csv data/CIC/  --test NearestNeighboursTest

# DoS GoldenEye

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ GoldenEye --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ GoldenEye --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ GoldenEye --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ GoldenEye --folder --csv data/CIC/  --test NearestNeighboursTest

# FTP Patator

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target FTP-Patator --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target FTP-Patator --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target FTP-Patator --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target FTP-Patator --folder --csv data/CIC/  --test NearestNeighboursTest

# SSH Patator

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target SSH-Patator --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target SSH-Patator --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target SSH-Patator --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target SSH-Patator --folder --csv data/CIC/  --test NearestNeighboursTest

# Port Scan

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target PortScan --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target PortScan --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target PortScan --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target PortScan --folder --csv data/CIC/  --test NearestNeighboursTest

# DoS slowloris

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ slowloris --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ slowloris --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ slowloris --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ slowloris --folder --csv data/CIC/  --test NearestNeighboursTest

# DoS Slowhttptest

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Slowhttptest --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Slowhttptest --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Slowhttptest --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target DoS\ Slowhttptest --folder --csv data/CIC/  --test NearestNeighboursTest

# Bot

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Bot --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Bot --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Bot --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Bot --folder --csv data/CIC/  --test NearestNeighboursTest

# Web Attack - Brute Force

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Brute\ Force --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Brute\ Force --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Brute\ Force --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Brute\ Force --folder --csv data/CIC/  --test NearestNeighboursTest

#### Due to the extreme class imbalance of the following classes, measures tend to be less useful. Still worthwhile indicators, but we need to take more care to
#### Ensure that they're actually mapping onto real issues

# Infiltration

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Infiltration --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Infiltration --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Infiltration --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Infiltration --folder --csv data/CIC/  --test NearestNeighboursTest

# Web Attack - Sql Injection

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Sql\ Injection --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Sql\ Injection --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Sql\ Injection --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Web\ Attack\ -\ Sql\ Injection --folder --csv data/CIC/  --test NearestNeighboursTest

# Heartbleed

python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Heartbleed --folder --csv data/CIC/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Heartbleed --folder --csv data/CIC/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Heartbleed --folder --csv data/CIC/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic/metadata.json --results results/CIC17/ --target Heartbleed --folder --csv data/CIC/  --test NearestNeighboursTest
