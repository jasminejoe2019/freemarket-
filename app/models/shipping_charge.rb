class ShippingCharge < ApplicationRecord
  # belongs to item
  validates :shipping_charge ,presence: true
end
