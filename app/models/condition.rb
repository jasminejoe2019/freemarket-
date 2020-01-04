class Condition < ApplicationRecord
  # belongs_to :item
  validates :condition,presence: true
end
