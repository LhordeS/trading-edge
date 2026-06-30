class OpeningRangeAnalyzer
  OPENING_RANGE_DURATION = 30.minutes

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

  def maximum_favorable_excursion
    return nil unless breakout_candle

    if breakout_direction == :long
      candles_after_breakout.maximum(:high) - opening_range_high
    else opening_range_low - candles_after_breakout.minimum(:low)
    end
  end

  def maximum_adverse_excursion
    return nil unless breakout_candle
    if breakout_direction == :long
      opening_range_low - candles_after_breakout.minimum(:low)
    else
      candles_after_breakout.maximum(:high) - opening_range_high
    end
  end

  private
  def opening_range_end_time
    opening_range_candles.last.timestamp
  end

  def opening_range_high
    opening_range_candles.maximum(:high)
  end

  def opening_range_low
    opening_range_candles.minimum(:low)
  end

  def candles_after_opening_range
    @trading_day.ordered_candles.where("timestamp > ?", opening_range_end_time)
  end

  def opening_range_candles
    @trading_day.ordered_candles
    .where(timestamp: @trading_day.market_open...(@trading_day.market_open + OPENING_RANGE_DURATION))
  end

  def candles_after_breakout
    return [] unless breakout_candle

    candles_after_opening_range.where("timestamp > ?", breakout_candle.timestamp)
  end
end
