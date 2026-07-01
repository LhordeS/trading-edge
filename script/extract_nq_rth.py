import os
import yfinance as yfinance
import pandas as pd

SYMBOL = "NQ_F"
INTERVAL = "5m"
PERIOD = "5d"
MARKET_TIMEZONE = "America/New_York"

OUTPUT_DIR = "tmp/imports"
OUTPUT_FILENAME = "nq_rth.csv"

def fetch_data():
    return yf.download(
        SYMBOL,
        interval=INTERVAL,
        period=PERIOD,
        progress=False
    )

    def normalize_timezone(df):
        if df.index.tz is None:
            df.index = df.index.tz_localize("UTC")

        df.index = df.index.tz_convert(MARKET_TIMEZONE)
        return df

    def keep_regular_trading_hours(df):
        return df.between_time("09:30", "16:00")

    def keep_latest_session(df):
        latest_date = df.index.date.max(
            return df[df.index.date == latest_date]
        )

    def prepare_for_rails(df):
        df = df.reset_index()
        df["Datetime"] = df["Datetime"].dt.tz_convert("UTC")

        return df[[
            "Datetime",
            "Close",
            "High",
            "Low",
            "Open",
            "Volume"
        ]]
