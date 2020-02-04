class Condition < ApplicationRecord
  has_many :items, dependent: :destroy
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  validates :condition,presence: true
end
