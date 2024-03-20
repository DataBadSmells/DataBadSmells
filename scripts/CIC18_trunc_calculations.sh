#!/bin/bash

# DoS attacks-Hulk

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target DoS\ attacks-Hulk --folder --csv data/CIC18_trunc/  --test CompleteTest

# FTP-BruteForce

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target FTP-BruteForce --folder --csv data/CIC18_trunc/  --test CompleteTest


# SSH-Bruteforce

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target SSH-Bruteforce --folder --csv data/CIC18_trunc/  --test CompleteTest


# DoS attacks-SlowHTTPTest

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target DoS\ attacks-SlowHTTPTest --folder --csv data/CIC18_trunc/  --test CompleteTest


# DoS attacks-GoldenEye

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target DoS\ attacks-GoldenEye --folder --csv data/CIC18_trunc/  --test CompleteTest

# DoS attacks-Slowloris

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target DoS\ attacks-Slowloris --folder --csv data/CIC18_trunc/  --test CompleteTest

# DDOS attack-HOIC

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target DDoS\ attack-HOIC --folder --csv data/CIC18_trunc/  --test CompleteTest

# Bot

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target Bot --folder --csv data/CIC18_trunc/  --test CompleteTest

# Infilteration

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target Infilteration --folder --csv data/CIC18_trunc/  --test CompleteTest

# Brute Force -Web      

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target Brute\ Force\ -Web --folder --csv data/CIC18_trunc/  --test CompleteTest

# Brute Force -XSS

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target Brute\ Force\ -XSS --folder --csv data/CIC18_trunc/  --test CompleteTest

# SQL Injection

python3 ./src/netstats.py --metadata metadata/cic2018/metadata.json --results results/CIC18_trunc/ --target SQL\ Injection --folder --csv data/CIC18_trunc/  --test CompleteTest
