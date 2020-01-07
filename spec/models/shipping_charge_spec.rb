require 'rails_helper'
describe ShippingCharge do
  describe '#create' do
    it "is invalid without a shipping_charge" do
      shipping_charge = build(:shipping_charge,shipping_charge: "")
      shipping_charge.valid?
      expect(shipping_charge.errors[:shipping_charge]).to include("can't be blank")
    end
  end
end