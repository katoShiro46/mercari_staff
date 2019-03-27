require 'rails_helper'

describe Deal do
  describe  "#create" do
    it "is invalid without status" do
      deal = build(:deal, status: nil)
      deal.valid?
      expect(deal).to be_valid
    end

    it "is invalid without user_id" do
      deal = build(:deal, user_id: nil)
      deal.valid?
      expect(deal.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without item_id" do
      deal = build(:deal, item_id: nil)
      deal.valid?
      expect(deal.errors[:item_id]).to include("can't be blank")
    end
  end
end
