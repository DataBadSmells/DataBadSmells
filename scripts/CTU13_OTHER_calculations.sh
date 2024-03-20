#!/bin/bash

###############################
######## Donbot 6 #############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/donbot/6/TCP\ Attempt/metadata_bg.json --results results/CTU/6/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/6/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/donbot/6/TCP\ Attempt/metadata_normal.json --results results/CTU/6/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/6/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/donbot/6/CC/metadata_normal.json --results results/CTU/6/normal/ --target MAL_CC --folder --csv data/CTU/6/  --test CompleteTest

###############################
######## Murlo 8 ##############
###############################

# TCP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/murlo/8/TCP\ Attempt/metadata_bg.json --results results/CTU/8/background/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/8/  --test CompleteTest

# TCP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/murlo/8/TCP\ Attempt/metadata_normal.json --results results/CTU/8/normal/ --target MAL_TCP_ATTEMPT --folder --csv data/CTU/8/  --test CompleteTest

############################################################

# TCP CC - Normal

python3 ./src/netstats.py --metadata metadata/ctu/murlo/8/CC/metadata_normal.json --results results/CTU/8/normal/ --target MAL_CC --folder --csv data/CTU/8/  --test CompleteTest

############################################################

# UDP Established - Background

python3 ./src/netstats.py --metadata metadata/ctu/murlo/8/UDP\ Established/metadata_bg.json --results results/CTU/8/background/ --target MAL_UDP_ESTABLISHED --folder --csv data/CTU/8/  --test CompleteTest

# UDP Established - Normal

python3 ./src/netstats.py --metadata metadata/ctu/murlo/8/UDP\ Established/metadata_normal.json --results results/CTU/8/normal/ --target MAL_UDP_ESTABLISHED --folder --csv data/CTU/8/  --test CompleteTest

###############################
######## NSIS 12 ##############
###############################

# UDP ATTEMPT - Background

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ Attempt/metadata_bg.json --results results/CTU/12/background/ --target MAL_UDP_ATTEMPT --folder --csv data/CTU/12/  --test CompleteTest

# UDP ATTEMPT - Normal

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ Attempt/metadata_normal.json --results results/CTU/12/normal/ --target MAL_UDP_ATTEMPT --folder --csv data/CTU/12/  --test CompleteTest

############################################################

# UDP DNS - Background

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ DNS/metadata_bg.json --results results/CTU/12/background/ --target MAL_UDP_DNS --folder --csv data/CTU/12/  --test CompleteTest

# UDP DNS - Normal

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ DNS/metadata_normal.json --results results/CTU/12/normal/ --target MAL_UDP_DNS --folder --csv data/CTU/12/  --test CompleteTest

############################################################

# UDP Established - Background

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ Established/metadata_bg.json --results results/CTU/12/background/ --target MAL_UDP_ESTABLISHED --folder --csv data/CTU/12/  --test CompleteTest

# UDP Established - Normal

python3 ./src/netstats.py --metadata metadata/ctu/nsis/12/UDP\ Established/metadata_normal.json --results results/CTU/12/normal/ --target MAL_UDP_ESTABLISHED --folder --csv data/CTU/12/  --test CompleteTest