class Item < ApplicationRecord
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :category, dependent: :destroy,optional: true
  # belongs_to :brand, dependent: :destroy,optional: true
  has_many :images
  # belongs_to :size, dependent: :destroy,optional: true
  # belongs_to :condition, dependent: :destroy,optional: true
  # belongs_to :shipping_charge, dependent: :destroy,optional: true
  # belongs_to :shipping_method, dependent: :destroy,optional: true
  # belongs_to :delivery_areas, dependent: :destroy,optional: true
  # belongs_to :estimated_shipping_date, dependent: :destroy,optional: true
  # belongs_to :status, dependent: :destroy,optional: true
  # belongs to :user,dependent: :destroy,optional: true
  has_many :trades,dependent: :destroy,optional: true
  validates :name,presence: true,length: {maximum: 40}
  validates :price,presence: true
  validates :description,presence: true,length: {maximum: 1000}


end
