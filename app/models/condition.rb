class Condition < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :condition,presence: true
end
