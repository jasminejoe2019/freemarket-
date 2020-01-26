require 'rails_helper'

describe EstimatedShippingDate do
  describe '#create' do
    it "is invalid without a estimated_shipping_date" do
      estimated_shipping_date = build(:estimated_shipping_date,estimated_shipping_date: "")
      estimated_shipping_date.valid?
      expect(estimated_shipping_date.errors[:estimated_shipping_date]).to include("can't be blank")
    end
  end
end