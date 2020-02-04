class ShippingAddress < ApplicationRecord
  belongs_to :user,optional: true
  validates :first_name, :first_furigana, :family_name, :family_furigana, :postal_code, :prefecture, :city, :address,
  presence: true
end
