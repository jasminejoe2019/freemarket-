require 'rails_helper'
describe Brand do
  describe '#create' do
    it "is invalid without a brand" do
      image = build(:brand,brand: "")
      image.valid?
      expect(image.errors[:brand]).to include("can't be blank")
    end
  end
end
