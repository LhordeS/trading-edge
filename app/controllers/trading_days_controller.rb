class TradingDaysController < ApplicationController
  def index
    @trading_days = TradingDay.all
  end

  def show
    @trading_day = TradingDay.find(params[:id])
    @candles = @trading_day.candles.order(:timestamp)
  end
end
