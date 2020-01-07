require 'rails_helper'

describe Trade do
  describe '#create' do
    it "is invalid without a transaction_date" do
      trade = build(:trade,transaction_date: "")
      trade.valid?
      expect(trade.errors[:transaction_date]).to include("can't be blank")
    end
    it "is valid with a transaction_date" do
      trade = build(:trade)
      trade.valid?
      expect(trade).to be_valid
    end
  end
end
