class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :first_furigana, presence: true
  validates :birthday, presence: true
  validates :telephone, presence: true
  validates :sns_credential, uniqueness: true
  validates :sales, presence: true


end
