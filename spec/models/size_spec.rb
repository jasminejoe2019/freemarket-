require 'rails_helper'
describe Size do
  describe '#create' do
    it "is invalid without a size" do
      size = build(:size,size: "")
      size.valid?
      expect(size.errors[:size]).to include("can't be blank")
    end
  end
end