class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_KANA_REGEX=/\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_MOBILE_REGEX=/\A[0]+[789]+[0]\d{8}\z/

  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true,format: {with: VALID_EMAIL_REGEX,message: 'メールアドレスが正しくありません。'}
  validates :password, presence: true,length: { minimum: 7 }
  validates :first_name, presence: true
  validates :first_furigana, presence: true,format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :family_name, presence: true
  validates :family_furigana, presence: true,format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :birthday, presence: true
  validates :mobile, presence: true,format: {with:VALID_MOBILE_REGEX,message: 'が正しくありません（ハイフンなし）。'}
  validates :sales, presence: true
  has_many :items
  has_many :trades
  has_many :banks
  has_many :payments
  has_many :addresses
  has_many :shipping_addresses
  has_many :sns_credential
end
