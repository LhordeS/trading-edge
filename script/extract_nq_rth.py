from datetime import datetime
import yfinance as yf

ticker = "NQ=F"
start = datetime(2026, 6, 25, 9, 30)
end = datetime(2026, 6, 25, 16, 0)
# filename = f"nq_{start.year}-{start.month}-{start.day}"
filename = f"nq_{start:%Y-%m-%d}" # short-form of the above

data = yf.download(ticker, start=start, end = end, interval="5m")

print(f"Saved {len(data)} candles to {filename}")
data.to_csv(f"tmp/imports/{filename}.csv")
