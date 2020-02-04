class EstimatedShippingDate < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :estimated_shipping_date,presence: true
end
