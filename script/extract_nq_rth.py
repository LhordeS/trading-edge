from datetime import datetime
import yfinance as yf
import sys

ticker = "NQ=F"

if len(sys.argv) < 2:
    raise SystemExit("Error: File not saved. Usage: Python scripts/extract_nq_rth.py YYYY-MM-DD")
start_date = sys.argv[1]
start_date = datetime.strptime(start_date, "%Y-%m-%d")
end_date = sys.argv[2]
end_date = datetime.strptime(end_date, "%Y-%m-%d")
start = start_date.replace(hour=9, minute=30)
end = end_date.replace(hour=16, minute=0)
filename = f"nq_{start:%Y-%m-%d}_to_{end:%Y-%m-%d}"

data = yf.download(ticker, start=start, end = end, interval="5m")
data = data.between_time("9:30", "15:55")
print(data.tail())

print(f"Saved {len(data)} candles to {filename}")
data.to_csv(f"tmp/imports/{filename}.csv")
#
#
