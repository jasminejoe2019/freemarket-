class Item < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :brands, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_many :conditions, dependent: :destroy
  has_many :shipping_charges, dependent: :destroy
  has_many :shipping_methods, dependent: :destroy
  has_many :delivery_areas, dependent: :destroy
  has_many :estimated_shipping_dates, dependent: :destroy
  has_many :statuses, dependent: :destroy
  belongs_to :user
  belongs_to :trade
end
