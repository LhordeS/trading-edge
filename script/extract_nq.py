from datetime import datetime
import yfinance as yf

ticker = "NQ=F"

def fetch_data():
    data = yf.download(
        ticker,
        period="7d",
        interval="1m"
    )
    return data

if __name__ == "__main__":
    data = fetch_data()
    print(data.tail())
