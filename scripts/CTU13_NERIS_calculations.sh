#!/bin/bash

###############################
######## Neris 1 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/TCP\ Attempt/metadata_bg.json --results results/CTU/1/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/1/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/TCP\ Attempt/metadata_normal.json --results results/CTU/1/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/1/  --test CompleteTest

###################################################

# UDP DNS - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/UDP\ DNS/metadata_bg.json --results results/CTU/1/background/ --target MAL_UDP_DNS --folder --csv data/CTU/1/  --test CompleteTest

# UDP DNS - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/UDP\ DNS/metadata_normal.json --results results/CTU/1/normal/ --target MAL_UDP_DNS --folder --csv data/CTU/1/  --test CompleteTest

###################################################

# UDP Attempt - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/UDP\ Attempt/metadata_bg.json --results results/CTU/1/background/ --target MAL_UDP_ATTEMPT_DNS --folder --csv data/CTU/1/  --test CompleteTest


# UDP Attempt - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/UDP\ Attempt/metadata_normal.json --results results/CTU/1/normal/ --target MAL_UDP_ATTEMPT_DNS --folder --csv data/CTU/1/  --test CompleteTest

############################################################

# TCP ESTABLISHED - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/TCP\ Established/metadata_bg.json --results results/CTU/1/background/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/1/  --test CompleteTest

# TCP ESTABLISHED - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/1/TCP\ Established/metadata_normal.json --results results/CTU/1/normal/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/1/  --test CompleteTest


###############################
######## Neris 2 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/TCP\ Attempt/metadata_bg.json --results results/CTU/2/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/2/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/TCP\ Attempt/metadata_normal.json --results results/CTU/2/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/2/  --test CompleteTest

###################################################

# UDP DNS - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/UDP\ DNS/metadata_bg.json --results results/CTU/2/background/ --target MAL_UDP_DNS --folder --csv data/CTU/2/  --test CompleteTest

# UDP DNS - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/UDP\ DNS/metadata_normal.json --results results/CTU/2/normal/ --target MAL_UDP_DNS --folder --csv data/CTU/2/  --test CompleteTest


############################################################

# TCP ESTABLISHED - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/TCP\ Established/metadata_bg.json --results results/CTU/2/background/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/2/  --test CompleteTest

# TCP ESTABLISHED - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/TCP\ Established/metadata_normal.json --results results/CTU/2/normal/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/2/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/CC/metadata_normal.json --results results/CTU/2/normal/ --target MAL_TCP_CC --folder --csv data/CTU/2/  --test CompleteTest

############################################################

# TCP Down - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/2/Down/metadata_normal.json --results results/CTU/2/normal/ --target MAL_TCP_DOWN --folder --csv data/CTU/2/  --test CompleteTest


###############################
######## Neris 9 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/TCP\ Attempt/metadata_bg.json --results results/CTU/9/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/9/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/TCP\ Attempt/metadata_normal.json --results results/CTU/9/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/9/  --test CompleteTest

###################################################

# UDP FLOOD - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/UDP\ DNS/metadata_bg.json --results results/CTU/9/background/ --target MAL_UDP_FLOOD --folder --csv data/CTU/9/  --test CompleteTest

# UDP FLOOD - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/UDP\ DNS/metadata_normal.json --results results/CTU/9/normal/ --target MAL_UDP_FLOOD --folder --csv data/CTU/9/  --test CompleteTest


############################################################

# TCP ESTABLISHED - Background

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/TCP\ Established/metadata_bg.json --results results/CTU/9/background/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/9/  --test CompleteTest

# TCP ESTABLISHED - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/TCP\ Established/metadata_normal.json --results results/CTU/9/normal/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/9/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/CC/metadata_normal.json --results results/CTU/9/normal/ --target MAL_CC --folder --csv data/CTU/9/  --test CompleteTest

############################################################

# SMTP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/Neris/9/SMTP/metadata_normal.json --results results/CTU/9/normal/ --target MAL_SMTP --folder --csv data/CTU/9/  --test CompleteTest



