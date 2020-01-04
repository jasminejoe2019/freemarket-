class Size < ApplicationRecord
  # belongs to item
  validates :size,presence: true
end
