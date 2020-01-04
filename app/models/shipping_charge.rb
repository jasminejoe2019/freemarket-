class ShippingCharge < ApplicationRecord
  # belongs_to :item
  validates :shipping_charge ,presence: true
end
