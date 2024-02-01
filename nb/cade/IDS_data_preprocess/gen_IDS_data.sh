###### Using Infilteration as the unsee family ######
mkdir -p logs/IDS_new_Infilteration/ &&                                                 \
nohup python -u gen_IDS_data.py                                                         \
                --name IDS_new_Infilteration                                            \
                --benign 02_14_2018                                                     \
                --mal 02_14_2018,'SSH-BruteForce'/02_16_2018,"DoS Hulk"         \
                --new-mal 03_01_2018,"Infiltration"                                 \
                --sampling-ratio 0.1                                                    \
                > logs/IDS_new_Infilteration/gen_data_$(date "+%m.%d-%H.%M.%S").log &


###### Using DoS_Hulk as the unsee family ######
mkdir -p logs/IDS_new_Hulk/ &&                                                          \
nohup python -u gen_IDS_data.py                                                         \
                --name IDS_new_Hulk                                                     \
                --benign 02_14_2018                                                     \
                --mal 02_14_2018,"SSH-BruteForce"/03_01_2018,"Infiltration"            \
                --new-mal 02_16_2018,"DoS Hulk"                                 \
                --sampling-ratio 0.1                                                    \
                > logs/IDS_new_Hulk/gen_data_$(date "+%m.%d-%H.%M.%S").log &


# ###### Using SSH-Bruteforce as the unsee family ######
mkdir -p logs/IDS_new_SSH/ &&                                                           \
nohup python -u gen_IDS_data.py                                                         \
                --name IDS_new_SSH                                                      \
                --benign 02_14_2018                                                     \
                --mal 02_16_2018,"DoS Hulk"/03_01_2018,"Infiltration"          \
                --new-mal 02_14_2018,"SSH-BruteForce"                                   \
                --sampling-ratio 0.1                                                    \
                > logs/IDS_new_SSH/gen_data_$(date "+%m.%d-%H.%M.%S").log &
