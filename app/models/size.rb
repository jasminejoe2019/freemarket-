class Size < ApplicationRecord
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  validates :size,presence: true
end
