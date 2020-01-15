class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items,dependent: :destroy
  has_many :trades,dependent: :destroy
  has_many :payments,dependent: :destroy
  has_many :banks,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :shipping_addresses,dependent: :destroy
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :payments
end
