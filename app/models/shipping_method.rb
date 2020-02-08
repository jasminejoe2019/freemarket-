class ShippingMethod < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :shipping_method ,presence: true
end
