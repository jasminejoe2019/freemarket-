class Category < ApplicationRecord
  #has_many :items
  has_ancestry
  # コメントアウト部分は段階的に実装予定です
  # belongs_to :item
  #validates :category,presence: true
end
