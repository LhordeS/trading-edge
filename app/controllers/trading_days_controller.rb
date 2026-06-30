class TradingDaysController < ApplicationController
  def index
    @trading_days = TradingDay.all
  end

  def show
    @trading_day = TradingDay.find(params[:id])
    @candles = @trading_day.candles.order(:timestamp)
    @opening_range_analysis = OpeningRangeAnalyzer.new(@trading_day)
  end
end
