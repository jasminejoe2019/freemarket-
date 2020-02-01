require 'rails_helper'

describe DeliveryArea do
  describe '#create' do
    it "is invalid without a delivery_area" do
      delivery_area = build(:delivery_area,delivery_area: "")
      delivery_area.valid?
      expect(delivery_area.errors[:delivery_area]).to include("can't be blank")
    end
  end
end