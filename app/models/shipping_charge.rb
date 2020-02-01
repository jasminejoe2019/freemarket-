class ShippingCharge < ApplicationRecord
  belongs_to :item
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  validates :shipping_charge ,presence: true
end
