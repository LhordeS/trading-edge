require "csv"

class CsvCandleImporter
  def initialize(file_path:)
    @file_path = file_path
  end

  def rows
    CSV.read(@file_path, headers: true)
  end

  def headers
    rows.headers
  end
end
