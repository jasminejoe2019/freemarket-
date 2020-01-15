require 'rails_helper'

describe Status do
  describe '#create' do
    it "is invalid without a status" do
      status = build(:status,status: "")
      status.valid?
      expect(status.errors[:status]).to include("can't be blank")
    end
  end
end