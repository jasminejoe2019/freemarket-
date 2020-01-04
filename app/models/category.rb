class Category < ApplicationRecord
  # belongs_to :item
  validates :category,presence: true
end
