class TradingDayBuilder
  def initialize(candles)
    @candles = candles.sort_by { |candle| candle[:timestamp] }

    def trading_days
      [@candles]
    end
  end
end
