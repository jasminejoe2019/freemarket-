require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user,nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "is invalid without a email" do
      user = build(:user,email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without a password" do
      user = build(:user,password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "is invalid without unmatching password_confirmation" do
      user = build(:user,password_confirmation: "a")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a first_name" do
      user = build(:user,first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "is invalid without a first_furigana" do
      user = build(:user,first_furigana: "")
      user.valid?
      expect(user.errors[:first_furigana]).to include("can't be blank")
    end
    it "is invalid without a family_name" do
      user = build(:user,family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it "is invalid without a family_furigana" do
      user = build(:user,family_furigana: "")
      user.valid?
      expect(user.errors[:family_furigana]).to include("can't be blank")
    end
    it "is invalid without a birthday" do
      user = build(:user,birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    it "is invalid without a telephone" do
      user = build(:user,telephone: "")
      user.valid?
      expect(user.errors[:telephone]).to include("can't be blank")
    end
    it "is invalid without a sales" do
      user = build(:user,sales: "")
      user.valid?
      expect(user.errors[:sales]).to include("can't be blank")
    end
    # it "is invalid with a duplicate sns_credential" do
    #   shipping_address=create(:shipping_address)
    #   user=create(:user)
    #   another_user = build(:user)
    #   another_user.valid?
    #   expect(user.errors[:sns_credential]).to include("has already been taken")
    # end
    it "is invalid with a regulation first_furigana" do
      user = build(:user,first_furigana: "a")
      user.valid?
      expect(user.errors[:first_furigana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid with a regulation family_furigana" do
      user = build(:user,family_furigana: "a")
      user.valid?
      expect(user.errors[:family_furigana]).to include("はカタカナで入力して下さい。")
    end
  end
end