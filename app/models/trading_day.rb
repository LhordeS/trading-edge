class TradingDay < ApplicationRecord
  has_many :market_events, dependent: :destroy
  has_many :setup_occurrences, dependent: :destroy
  has_many :candles, dependent: :destroy

  validates :date, :symbol, presence: true

  def session_high
    candles.maximum(:high)
  end

  def session_low
    candles.minimum(:low)
  end

  def ordered_candles
    candles.order(:timestamp)
  end

  def opening_range_candles
    start_time = ordered_candles.first.timestamp
    end_time = start_time + 30.minutes

    ordered_candles.where(timestamp: start_time...end_time)
  end

  def candles_after_opening_range
    ordered_candles.where("timestamp > ?", opening_range_candles.last.timestamp)
  end

  def opening_range_high
    opening_range_candles.maximum(:high)
  end

  def opening_range_low
    opening_range_candles.minimum(:low)
  end
end
