class Status < ApplicationRecord
  belongs_to :item
  validates :status,presence: true
end
