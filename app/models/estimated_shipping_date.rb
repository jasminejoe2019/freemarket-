class EstimatedShippingDate < ApplicationRecord
  # belongs to item
  validates :estimated_shipping_date,presence: true
end
