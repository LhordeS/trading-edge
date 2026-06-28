require "csv"
require "bigdecimal"

class CsvCandleImporter
  def initialize(file_path:)
    @file_path = file_path
  end

  def rows
    CSV.read(@file_path).select do |row|
      row.first&.match?(/^\d{4}-\d{2}/)
    end
  end

  def candles
    rows.map do |row|
      {
        timestamp: Time.zone.parse(row[0]),
        close: BigDecimal(row[1]),
        high: BigDecimal(row[2]),
        low: BigDecimal(row[3]),
        open: BigDecimal(row[4]),
        volume: BigDecimal(row[5])
      }
    end
  end

  def import!(trading_day:)
    parsed_candles = candles
    parsed_candles.each do |candle_data|
      trading_day.candles.create!(candle_data)
    end
    parsed_candles.size
  end
end
