class TradingDay < ApplicationRecord
  has_many :market_events, dependent: :destroy
  has_many :setup_occurrences, dependent: :destroy

  validates :date, :symbol, presence: true
end
