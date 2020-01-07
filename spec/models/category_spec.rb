require 'rails_helper'

describe Category do
  describe '#create' do
    it "is invalid without a category" do
      category = build(:category,category: "")
      category.valid?
      expect(category.errors[:category]).to include("can't be blank")
    end
  end
end