class OpeningRangeAnalyzer
  def initialize(trading_day)
    @trading_day = trading_day
  end

  def breakout?
    @trading_day.candles_after_opening_range.where("high > ?", @trading_day.opening_range_high).exists?
  end
end
