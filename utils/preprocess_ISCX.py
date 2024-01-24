import pandas as pd


files = ['TestbedSunJun13Flows.csv', 'TestbedMonJun14Flows.csv', 'TestbedTueJun15-1Flows.csv', 'TestbedTueJun15-2Flows.csv', 'TestbedTueJun15-3Flows.csv',
         'TestbedWedJun16-1Flows.csv', 'TestbedWedJun16-2Flows.csv', 'TestbedThuJun17-1Flows.csv', 'TestbedThuJun17-2Flows.csv', 'TestbedThuJun17-3Flows.csv']

full_cols = []

for file in files:
    df = pd.read_csv('data/ISCX/' + file)

    df['startDateTime'] = pd.to_datetime(df['startDateTime']).map(pd.Timestamp.timestamp)
    df['stopDateTime'] = pd.to_datetime(df['stopDateTime']).map(pd.Timestamp.timestamp)

    df['duration'] = df['stopDateTime'] - df['startDateTime']

    if file == 'TestbedWedJun16-1Flows.csv':
        drop_cols = ['Unnamed: 0', 'startTime', 'sourcePayloadAsBase64', 'sourcePayloadAsUTF', 'destinationPayloadAsBase64' , 'destinationPayloadAsUTF', 'startDateTime', 'stopDateTime']
    elif file == 'TestbedTueJun15-1Flows.csv':
        drop_cols = ['Unnamed: 0', 'sensorInterfaceId', 'sourcePayloadAsBase64', 'sourcePayloadAsUTF', 'destinationPayloadAsBase64' , 'destinationPayloadAsUTF', 'startDateTime', 'stopDateTime']
    elif file == 'TestbedMonJun14Flows.csv':
        drop_cols = ['Unnamed: 0', 'sourcePayloadAsBase64', 'destinationPayloadAsBase64' , 'destinationPayloadAsUTF', 'startDateTime', 'stopDateTime']
    else:
        drop_cols = ['Unnamed: 0', 'sourcePayloadAsBase64', 'sourcePayloadAsUTF', 'destinationPayloadAsBase64' , 'destinationPayloadAsUTF', 'startDateTime', 'stopDateTime']

    print(file)

    df = df.replace(pd.NA, 'N')

    proto_one_hot = pd.get_dummies(df['protocolName'])
    df = df.join(proto_one_hot)
    drop_cols.append('protocolName')

    dir_one_hot = pd.get_dummies(df['direction'])
    df = df.join(dir_one_hot)
    drop_cols.append('direction')   

    src_one_hot = pd.get_dummies(df['sourceTCPFlagsDescription'], prefix='src_flags_')
    df = df.join(src_one_hot)
    drop_cols.append('sourceTCPFlagsDescription')       

    dst_one_hot = pd.get_dummies(df['destinationTCPFlagsDescription'], prefix='dst_flags_')
    df = df.join(dst_one_hot)
    drop_cols.append('destinationTCPFlagsDescription')   

    df = df.drop(drop_cols, axis=1)

    df["tagApp"] = "Normal"


    df = df.drop(df[((df["totalDestinationBytes"] % 64) == 0)
                & ((df["totalSourceBytes"] % 64) == 0)
                & (df["Tag"] == "Normal")].index)

    df = df.reset_index(drop=True)

    df["tagApp"].iloc[(df[((df["totalDestinationBytes"] % 64) != 0) 
                            & ((df["totalSourceBytes"] % 64) != 0) 
                            & (df["Tag"] == "Attack")]).index] = df["Tag"].iloc[(df[((df["totalDestinationBytes"] % 64) != 0) & ((df["totalSourceBytes"] % 64) != 0) & (df["Tag"] == "Attack")]).index] + '_' + df["appName"].iloc[(df[((df["totalDestinationBytes"] % 64) != 0) & ((df["totalSourceBytes"] % 64) != 0) & (df["Tag"] == "Attack")]).index]
    df["tagApp"].iloc[(df[((df["totalDestinationBytes"] % 64) == 0) & ((df["totalSourceBytes"] % 64) == 0) & (df["Tag"] == "Attack")]).index] = df["Tag"].iloc[(df[((df["totalDestinationBytes"] % 64) == 0) & ((df["totalSourceBytes"] % 64) == 0) & (df["Tag"] == "Attack")]).index] + '_' + "nmap"

    full_cols.extend(df.columns)

    df.to_csv('data/ISCX_preprocessed_label_full_64/' + file, index=False)

full_cols = list(set(full_cols))

for file in files:
    print(file)
    df = pd.read_csv('data/ISCX_preprocessed_label_full_64/' + file)
    for col in full_cols:
        if col not in df.columns:
            print("Here: ", col)
            df[col] = 0
    print(df["Tag"].value_counts())
    df.to_csv('data/ISCX_preprocessed_label_full_64/' + file, index=False)