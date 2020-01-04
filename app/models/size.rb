class Size < ApplicationRecord
  # belongs_to :item
  validates :size,presence: true
end
