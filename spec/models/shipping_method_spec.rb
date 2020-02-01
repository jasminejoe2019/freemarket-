require 'rails_helper'

describe ShippingMethod do
  describe '#create' do
    it "is invalid without a shipping_method" do
      shipping_method = build(:shipping_method,shipping_method: "")
      shipping_method.valid?
      expect(shipping_method.errors[:shipping_method]).to include("can't be blank")
    end
  end
end