#!/bin/bash

# DoS attacks-Hulk

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Hulk --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Hulk --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Hulk --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Hulk --folder --csv data/CIC18/  --test NearestNeighboursTest

# FTP-BruteForce

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target FTP-BruteForce --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target FTP-BruteForce --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target FTP-BruteForce --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target FTP-BruteForce --folder --csv data/CIC18/  --test NearestNeighboursTest


# SSH-Bruteforce

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SSH-Bruteforce --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SSH-Bruteforce --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SSH-Bruteforce --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SSH-Bruteforce --folder --csv data/CIC18/  --test NearestNeighboursTest


# DoS attacks-SlowHTTPTest

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-SlowHTTPTest --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-SlowHTTPTest --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-SlowHTTPTest --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-SlowHTTPTest --folder --csv data/CIC18/  --test NearestNeighboursTest


# DoS attacks-GoldenEye

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-GoldenEye --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-GoldenEye --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-GoldenEye --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-GoldenEye --folder --csv data/CIC18/  --test NearestNeighboursTest

# DoS attacks-Slowloris

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Slowloris --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Slowloris --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Slowloris --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DoS\ attacks-Slowloris --folder --csv data/CIC18/  --test NearestNeighboursTest

# DDOS attack-HOIC

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-HOIC --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-HOIC --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-HOIC --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-HOIC --folder --csv data/CIC18/  --test NearestNeighboursTest

# DDoS attacks-LOIC-HTTP

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attacks-LOIC-HTTP --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attacks-LOIC-HTTP --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attacks-LOIC-HTTP --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attacks-LOIC-HTTP --folder --csv data/CIC18/  --test NearestNeighboursTest

# DDOS attack-LOIC-UDP

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-LOIC-UDP --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-LOIC-UDP --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-LOIC-UDP --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target DDoS\ attack-LOIC-UDP --folder --csv data/CIC18/  --test NearestNeighboursTest

# Bot

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Bot --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Bot --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Bot --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Bot --folder --csv data/CIC18/  --test NearestNeighboursTest

# Infilteration

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Infilteration --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Infilteration --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Infilteration --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Infilteration --folder --csv data/CIC18/  --test NearestNeighboursTest

# Brute Force -Web      

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -Web --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -Web --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -Web --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -Web --folder --csv data/CIC18/  --test NearestNeighboursTest

# Brute Force -XSS

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -XSS --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -XSS --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -XSS --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target Brute\ Force\ -XSS --folder --csv data/CIC18/  --test NearestNeighboursTest

# SQL Injection

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SQL\ Injection --folder --csv data/CIC18/  --test CosineTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SQL\ Injection --folder --csv data/CIC18/  --test PortTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SQL\ Injection --folder --csv data/CIC18/  --test SingleFeatureEfficacyTest
python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18/ --target SQL\ Injection --folder --csv data/CIC18/  --test NearestNeighboursTest
