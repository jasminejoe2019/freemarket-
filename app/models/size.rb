class Size < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :size, presence: true
end
