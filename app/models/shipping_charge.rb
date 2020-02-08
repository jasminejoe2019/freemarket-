class ShippingCharge < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :shipping_charge ,presence: true
end
