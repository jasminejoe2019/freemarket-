class EstimatedShippingDate < ApplicationRecord
  # belongs_to :item
  validates :estimated_shipping_date,presence: true
end
