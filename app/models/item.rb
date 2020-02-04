class Item < ApplicationRecord
  belongs_to :category 
  belongs_to :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :size 
  belongs_to :condition 
  belongs_to :shipping_charge 
  belongs_to :shipping_method 
  belongs_to :estimated_shipping_date 
  belongs_to :status
  belongs_to :user
  has_one :trade
  validates :name,presence: true,length: {maximum: 40}
  validates :price,presence: true
  validates :description,presence: true,length: {maximum: 1000}

end
