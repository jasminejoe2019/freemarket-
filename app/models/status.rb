class Status < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :status,presence: true
end
