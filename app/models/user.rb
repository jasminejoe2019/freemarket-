class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  has_many :sns_credentials,dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  def self.without_sns_data(auth)
    user=User.where(email:auth.info.email).first

    if user.present?
      sns=SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user=User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
      sns=SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    return {user: user,sns: sns}
  end

  def self.with_sns_data(auth,snscredential)
    user=User.where(id: snscredential.user_id).first

    unless user.present?
      user=User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end
  def self.find_oauth(auth)
    uid=auth.uid
    provider=auth.provider
    snscredential=SnsCredential.find_by(uid: uid,provider: provider)
    if snscredential.present?
      user=with_sns_data(auth,snscredential)[:user]
      sns=snscredential
    else
      user=without_sns_data(auth)[:user]
      sns=without_sns_data(auth)[:sns]
    end
    return {user: user,sns: sns}
  end

  VALID_KANA_REGEX=/\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_MOBILE_REGEX=/\A[0]+[789]+[0]\d{8}\z/

  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true,format: {with: VALID_EMAIL_REGEX,message: 'メールアドレスが正しくありません。'}
  validates :encrypted_password, presence: true,length: { minimum: 7 }
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

  # 調整中、後ほど利用します
  # def date_valid?
  #   # birthday = birthday_before_type_cast
  #   # return if birthday.blank?
  #   # y = birthday[0, 4].to_i
  #   # m = birthday[5, 2].to_i
  #   # d = birthday[8, 2].to_i
  #   # unless Date.valid_date?(y, m, d)
  #   #   errors.add(:birthday, "日付の値が不正です")
  #   # end
  # end



end
