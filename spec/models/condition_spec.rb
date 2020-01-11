require 'rails_helper'
describe Condition do
  describe '#create' do
    it "is invalid without a condition" do
      condition = build(:condition,condition: "")
      condition.valid?
      expect(condition.errors[:condition]).to include("can't be blank")
    end
  end
end
