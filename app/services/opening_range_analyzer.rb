class OpeningRangeAnalyzer
  def initialize(trading_day)
    @trading_day = trading_day
  end

  def breakout?
    breakout_candle.present?
  end

  def breakout_candle
    @trading_day.candles_after_opening_range.find { |candle| candle.high > @trading_day.opening_range_high }
  end

  def breakout_time
    breakout_candle&.timestamp
  end

  def minutes_to_breakout
    return nil unless breakout_time

    ((breakout_time - opening_range_end_time) / 60).to_i
  end

  private
  def opening_range_end_time
    @trading_day.opening_range_candles.last.timestamp
  end

end
