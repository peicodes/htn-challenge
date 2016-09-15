require 'bigdecimal'
require 'csv'

class ReturnCalculator
  attr_reader :snapshots

  def initialize(filename)
    @snapshots = read_snapshots(filename)
  end

  def calculate!
    raise 'Implement Me!'
  end

  private

  def read_snapshots(filename)
    CSV.read(filename).map do |row|
      {
        date: Date.parse(row[0]),
        cash_flow: BigDecimal.new(row[1]),
        market_value: BigDecimal.new(row[2]),
      }
    end
  end
end
