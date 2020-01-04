class Category < ApplicationRecord
  # belongs to item
  validates :category,presence: true
end
