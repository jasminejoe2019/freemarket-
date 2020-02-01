class EstimatedShippingDate < ApplicationRecord
  has_many :items
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  validates :estimated_shipping_date,presence: true
end
