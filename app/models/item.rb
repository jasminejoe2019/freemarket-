class Item < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :size, dependent: :destroy
  belongs_to :condition, dependent: :destroy
  belongs_to :shipping_charge, dependent: :destroy
  belongs_to :shipping_method, dependent: :destroy
  belongs_to :estimated_shipping_date, dependent: :destroy
  belongs_to :status, dependent: :destroy
  belongs_to :user
  has_one :trade
  validates :name,presence: true,length: {maximum: 40}
  validates :price,presence: true
  validates :description,presence: true,length: {maximum: 1000}
  
end
