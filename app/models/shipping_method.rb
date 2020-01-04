class ShippingMethod < ApplicationRecord
  # belongs to item
  validates :shipping_method ,presence: true
end
