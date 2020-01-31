class Category < ApplicationRecord
  has_many :items
  has_ancestry
  validates :category,presence: true
end
