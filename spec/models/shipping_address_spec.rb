require 'rails_helper'

describe ShippingAddress do
  describe '#create' do
    it "is invalid without a postal_code" do
      shipping_address = build(:shipping_address,postal_code: "")
      shipping_address.valid?
      expect(shipping_address.errors[:postal_code]).to include("can't be blank")
    end
    it "is invalid without a prefecture" do
      shipping_address = build(:shipping_address,prefecture: "")
      shipping_address.valid?
      expect(shipping_address.errors[:prefecture]).to include("can't be blank")
    end
    it "is invalid without a city" do
      shipping_address = build(:shipping_address,city: "")
      shipping_address.valid?
      expect(shipping_address.errors[:city]).to include("can't be blank")
    end
    it "is invalid without a address" do
      shipping_address = build(:shipping_address,address: "")
      shipping_address.valid?
      expect(shipping_address.errors[:address]).to include("can't be blank")
    end
  end
end