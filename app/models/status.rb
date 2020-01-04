class Status < ApplicationRecord
  # belongs to item
  validates :status,presence: true
end
