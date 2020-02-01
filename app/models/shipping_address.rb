class ShippingAddress < ApplicationRecord
  belongs_to :user,optional: true
  validates :first_name,presence: true
  validates :first_furigana,presence: true
  validates :family_name,presence: true
  validates :family_furigana,presence: true
  validates :postal_code,presence: true
  validates :prefecture,presence: true
  validates :city,presence: true
  validates :address,presence: true
end
