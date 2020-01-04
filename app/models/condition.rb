class Condition < ApplicationRecord
  # belongs to item
  validates :condition,presence: true
end
