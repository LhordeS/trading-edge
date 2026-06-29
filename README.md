TradingEdge
A structured trade journaling and setup backtesting tool for discretionary futures traders, built with Ruby on Rails.
Designed around the workflow of trading US equity index futures (ES, NQ, MNQ) on intraday timeframes.

What problem it solves
Most trade journals track outcomes — P&L, win rate — but not setups. TradingEdge is built around the idea that a disciplined trader should be able to answer: "When Setup X appeared under Condition Y, what actually happened next?" That question requires structured data, not a spreadsheet.
TradingEdge lets you define named setups, log when they appear in the market, and track the resulting price action with metrics that actually matter for evaluating edge: R-multiples, MAE, MFE, and lookahead outcomes at defined intervals.

Domain model
TradingDay
The root object. Represents a single session for a given symbol (e.g. ES on 2024-03-15). Stores session open/close times and ATR(14) — a volatility measure used to normalize risk across days.
Candle
OHLCV price data at a given timestamp, scoped to a TradingDay. Imported via CSV. Used for chart rendering and price context. Timestamps are unique per trading day to prevent duplicate imports.
SetupDefinition
A named, versioned trading setup — for example, "Opening Range Breakout", "VWAP Reclaim", or "Trend Pullback". Versioning allows the definition of a setup to evolve over time without corrupting historical occurrences logged against earlier versions.
SetupOccurrence
A specific instance of a SetupDefinition appearing on a given TradingDay. Records when it triggered (triggered_at), direction (long/short), and a flexible metadata JSON field for setup-specific context (e.g. breakout level, VWAP price at time of signal).
MarketEvent
Discrete events on a trading day that provide context for setups — for example, a news release, a liquidity sweep, or a session high/low being established. Includes direction, price level, and a metadata field for extensibility.
Outcome
The result of a SetupOccurrence measured at a specific lookahead_minutes interval. Tracks:

R-multiple — profit/loss expressed as a multiple of initial risk. The primary metric for evaluating edge independent of position size.
MAE (Maximum Adverse Excursion) — the worst drawdown before the trade resolved. Used to evaluate stop placement.
MFE (Maximum Favorable Excursion) — the best unrealized profit before the trade resolved. Used to evaluate target placement and early exit decisions.
stop_hit / target_hit — boolean flags for whether the trade reached its predefined levels.

Multiple Outcome records per occurrence allow comparison of how the same setup performed at different lookahead windows (e.g. 15 min vs 60 min vs EOD).

Current features

CSV candle import (CsvCandleImporter)
Candlestick chart rendering via Lightweight Charts
Trading day index and detail views
Setup definition seeding (Opening Range Breakout, VWAP Reclaim, Trend Pullback)
PostgreSQL with unique index constraints on candle timestamps and trading day symbol/date pairs


Roadmap

Setup occurrence logging UI
Outcome calculation and aggregation
R-multiple distribution charts
MAE/MFE scatter plots by setup
Filtering by setup, symbol, date range, and market condition
Authentication (Devise)
Python analysis layer — statistical aggregation of setup outcomes over time, including expectancy curves, regime-based performance breakdowns, and correlation analysis between market conditions and R-multiple distributions
AI discretion layer — LLM-assisted evaluation of setup quality at time of occurrence, incorporating market context, recent session behavior, and historical outcome data to surface confidence signals alongside human discretionary judgment


Tech stack

Ruby on Rails 8.1
PostgreSQL
Hotwire (Turbo + Stimulus)
Lightweight Charts (TradingView)
Deployed via Kamal


Setup
(bash)
bundle install
rails db:create db:migrate db:seed
rails server
