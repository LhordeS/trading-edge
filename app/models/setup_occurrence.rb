class SetupOccurrence < ApplicationRecord
  belongs_to :trading_day
  belongs_to :setup_definition
end
