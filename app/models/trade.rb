class Trade < ApplicationRecord
  # コメントアウト部分は段階的に実装予定です
  belongs_to :user
  belongs_to :item
end
