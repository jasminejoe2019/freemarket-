class Item < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :size, dependent: :destroy
  belongs_to :condition, dependent: :destroy
  belongs_to :shipping_charge, dependent: :destroy
  belongs_to :shipping_method, dependent: :destroy
  belongs_to :delivery_area, dependent: :destroy
  belongs_to :estimated_shipping_date, dependent: :destroy
  belongs_to :status, dependent: :destroy
  belongs_to :user
  has_one :trade
  # trade_id にnullを許可する
  # belongs_to :trade, optional: true
end
