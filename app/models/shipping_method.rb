class ShippingMethod < ApplicationRecord
  # belongs_to :item
  validates :shipping_method ,presence: true
end
