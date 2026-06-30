class OpeningRangeAnalyzer
  def initialize(trading_day)
    @trading_day = trading_day
  end

  def breakout?
    breakout_candle.present?
  end

  def breakout_candle
    candles_after_opening_range.find do |candle|
      candle.high > opening_range_high || candle.low < opening_range_low
    end
  end

  def breakout_direction
    return nil unless breakout_candle

    if breakout_candle.high > opening_range_high
      :long
    elsif breakout_candle.low < opening_range_low
      :short
    end
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

  def opening_range_high
    @trading_day.opening_range_candles.maximum(:high)
  end

  def opening_range_low
    @trading_day.opening_range_candles.minimum(:low)
  end

  def candles_after_opening_range
    @trading_day.ordered_candles.where("timestamp > ?", opening_range_end_time)
  end
end
