class Brand < ApplicationRecord
  # belongs_to :item
  validates :brand,presence: true
end
