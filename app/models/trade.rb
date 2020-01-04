class Trade < ApplicationRecord
  # belongs_to :user
  # belongs_to :item
  validates :transaction_date,presence: true
end
