#!/bin/bash

###############################
######## Virut 5 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/TCP\ Attempt/metadata_bg.json --results results/CTU/5/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/5/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/TCP\ Attempt/metadata_normal.json --results results/CTU/5/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/5/  --test CompleteTest

###################################################

# UDP DNS - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/UDP\ DNS/metadata_bg.json --results results/CTU/5/background/ --target MAL_UDP_DNS --folder --csv data/CTU/5/  --test CompleteTest

# UDP DNS - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/UDP\ DNS/metadata_normal.json --results results/CTU/5/normal/ --target MAL_UDP_DNS --folder --csv data/CTU/5/  --test CompleteTest


############################################################

# TCP ESTABLISHED - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/TCP\ Established/metadata_bg.json --results results/CTU/5/background/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/5/  --test CompleteTest

# TCP ESTABLISHED - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/TCP\ Established/metadata_normal.json --results results/CTU/5/normal/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/5/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/CC/metadata_normal.json --results results/CTU/5/normal/ --target MAL_CC --folder --csv data/CTU/5/  --test CompleteTest

############################################################

# SMTP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/5/SMTP/metadata_normal.json --results results/CTU/5/normal/ --target MAL_SMTP --folder --csv data/CTU/5/  --test CompleteTest


###############################
######## Virut 13 #############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/TCP\ Attempt/metadata_bg.json --results results/CTU/13/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/13/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/TCP\ Attempt/metadata_normal.json --results results/CTU/13/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/13/  --test CompleteTest

###################################################

# UDP DNS - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/UDP\ DNS/metadata_bg.json --results results/CTU/13/background/ --target MAL_UDP_DNS --folder --csv data/CTU/13/  --test CompleteTest

# UDP DNS - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/UDP\ DNS/metadata_normal.json --results results/CTU/13/normal/ --target MAL_UDP_DNS --folder --csv data/CTU/13/  --test CompleteTest


############################################################

# TCP ESTABLISHED - Background

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/TCP\ Established/metadata_bg.json --results results/CTU/13/background/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/13/  --test CompleteTest

# TCP ESTABLISHED - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/TCP\ Established/metadata_normal.json --results results/CTU/13/normal/ --target MAL_TCP_ESTABLISHED --folder --csv data/CTU/13/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/CC/metadata_normal.json --results results/CTU/13/normal/ --target MAL_CC --folder --csv data/CTU/13/  --test CompleteTest

############################################################

# SMTP - Normal

python3 ./src/netstats.py --metadata metadata/ctu/virut/13/SMTP/metadata_normal.json --results results/CTU/13/normal/ --target MAL_SMTP --folder --csv data/CTU/13/  --test CompleteTest
