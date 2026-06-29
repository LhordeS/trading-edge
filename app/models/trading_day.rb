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
end
