class Image < ApplicationRecord
  # belongs to item
  validates :image,presence: true
end
