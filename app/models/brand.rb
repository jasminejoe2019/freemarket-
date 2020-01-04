class Brand < ApplicationRecord
  # belongs to item
  validates :brand,presence: true
end
