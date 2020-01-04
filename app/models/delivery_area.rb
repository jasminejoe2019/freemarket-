class DeliveryArea < ApplicationRecord
  # belongs_to :item
  validates :delivery_area ,presence: true
end
