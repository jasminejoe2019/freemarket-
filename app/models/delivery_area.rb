class DeliveryArea < ApplicationRecord
  # belongs to item
  validates :delivery_area ,presence: true
end
