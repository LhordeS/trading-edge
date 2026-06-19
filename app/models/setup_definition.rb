class SetupDefinition < ApplicationRecord
  has_many :setup_occurrences

  validates :name, presence: true
end
