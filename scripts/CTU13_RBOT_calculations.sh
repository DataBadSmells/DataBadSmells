#!/bin/bash

###############################
######## rbot 3 ##############
###############################

# TCP ATTEMPT - Collision

#python3 ./src/netstats.py --metadata metadata/ctu/rbot/3/TCP\ Attempt/metadata_maybe.json --results results/CTU/3/background/ --target MAL_NMAP --folder --csv data/CTU/3/  --test CompleteTest

# TCP ATTEMPT - Normal

#python3 ./src/netstats.py --metadata metadata/ctu/rbot/3/TCP\ Attempt/metadata_normal.json --results results/CTU/3/normal/ --target MAL_NMAP --folder --csv data/CTU/3/  --test CompleteTest

###################################################

###############################
######## rbot 4 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/TCP\ Attempt/metadata_bg.json --results results/CTU/4/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/4/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/TCP\ Attempt/metadata_normal.json --results results/CTU/4/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/4/  --test CompleteTest

###################################################

# CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/CC/metadata_normal.json --results results/CTU/4/normal/ --target MAL_CC --folder --csv data/CTU/4/  --test CompleteTest


###################################################

# UDP Flood - Background

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/UDP\ Attempt/metadata_bg.json --results results/CTU/4/background/ --target MAL_UDP_ATTEMPT --folder --csv data/CTU/4/  --test CompleteTest


# UDP Flood - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/UDP\ Attempt/metadata_normal.json --results results/CTU/4/normal/ --target MAL_UDP_ATTEMPT --folder --csv data/CTU/4/  --test CompleteTest

############################################################


# ICMP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/4/ICMP/metadata_normal.json --results results/CTU/4/normal/ --target MAL_ICMP --folder --csv data/CTU/4/  --test CompleteTest

###############################
######## rbot 10 ##############
###############################

# ICMP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/10/ICMP/metadata_normal.json --results results/CTU/10/normal/ --target MAL_ICMP --folder --csv data/CTU/10/  --test CompleteTest

#################################################################

# UDP Flood - Background

python3 ./src/netstats.py --metadata metadata/ctu/rbot/10/UDP\ Attempt/metadata_bg.json --results results/CTU/10/background/ --target MAL_UDP_FLOOD --folder --csv data/CTU/10/  --test CompleteTest


# UDP Flood - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/10/UDP\ Attempt/metadata_normal.json --results results/CTU/10/normal/ --target MAL_UDP_FLOOD --folder --csv data/CTU/10/  --test CompleteTest


###############################################################################################


###############################
######## rbot 11 ##############
###############################

# ICMP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/rbot/11/ICMP/metadata_normal.json --results results/CTU/11/normal/ --target MAL_ICMP --folder --csv data/CTU/11/  --test CompleteTest

###############################################################################################


