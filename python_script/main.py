import requests
import json
import numpy as np
from sklearn.linear_model import LinearRegression
from datetime import datetime, timedelta
import firebase_admin
from firebase_admin import credentials, firestore


def getJson(value1, periodId):
    if periodId == "1DAY":
        time_start = (datetime.now() - timedelta(90)).strftime("%Y-%m-%d")
    elif periodId == "8HRS":
        time_start = (datetime.now() - timedelta(30)).strftime("%Y-%m-%d")
    elif periodId == "2HRS":
        time_start = (datetime.now() - timedelta(7)).strftime("%Y-%m-%d")
    elif periodId == "15MIN":
        time_start = (datetime.now() - timedelta(1)).strftime("%Y-%m-%d")

    time_end = datetime.now().strftime("%Y-%m-%d")

    #url = f"https://rest.coinapi.io/v1/exchangerate/{value1}/USD/history?period_id={periodId}&time_start={time_start}"
    url = f"https://rest.coinapi.io/v1/ohlcv/{value1}/USD/history?period_id={periodId}&time_start={time_start}&time_end={time_end}&limit=100&include_empty_items=false"
    #key = "C73A28B3-D542-4554-A1C4-A382EBC744A5"
    key = "9934895C-C07A-4D12-A1CA-87EFC572CC50"

    response = requests.get(url,
                            headers={
                                "X-CoinAPI-Key": key
                            }
                            )
    x = response.text
    return json.loads(x)

def getCoef(jsonY):
    modelY = []

    for jsonDay in jsonY:
        modelY.append((jsonDay["price_low"] + jsonDay["price_high"]) / 2)

    model = LinearRegression()
    modelX = [[i for i in range(len(modelY))]]
    modelX = np.array(modelX)
    modelX = modelX.T
    modelY = np.array(modelY)
    modelX.reshape(1, -1)
    modelY.reshape(-1, 1)
    model.fit(modelX, modelY)
    return model.coef_[0]

coins = ["BTC", "ETH", "ADA", "DOGE"]
periods = ["1DAY", "8HRS", "2HRS", "15MIN"]

#getJson("BTC", "15MIN")
#print(getCoef(getJson(sys.argv[1], sys.argv[2])))

volume = 0

cred = credentials.Certificate("./coinmatch-5cb09-firebase-adminsdk-g4obr-6700a02a5c.json")
default_app = firebase_admin.initialize_app(cred)
db = firestore.client()


for coin in coins:
    for period in periods:
        volume = 0
        data = getJson(coin,period)
        if period == "1DAY":
            volume = data[-1]["volume_traded"]
        elif period == "8HRS":
            for i in range(-1, -4, -1):
                volume += data[i]["volume_traded"]
        elif period == "2HRS":
            for i in range(-1, -13, -1):
                volume += data[i]["volume_traded"]
        elif period == "15MIN":
            for i in range(-1, -96, -1):
                volume += data[i]["volume_traded"]
        print(data)
        doc_ref = db.collection(coin).document(period)
        doc_ref.set({
            "coef": getCoef(data),
            "value": data[-1]["price_close"],
            "volume": volume
        })