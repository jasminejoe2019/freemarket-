class ShippingMethod < ApplicationRecord
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  validates :shipping_method ,presence: true
end
