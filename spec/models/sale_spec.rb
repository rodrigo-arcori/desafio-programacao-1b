require 'rails_helper'

RSpec.describe Sale, type: :model do
  subject(:sale) { FactoryGirl.create(:sale) }
  describe '#update_or_create' do
    it "has a valid factory" do
      expect(sale).to be_valid
    end
  end

  context 'when the sale doesnt exists in the database' do
    it "creates a new sale on the database" do
      expect{Sale.where(description: "R$10 off R$20 of food").create(id: 1)}.to change(Sale,:count).by(1)
    end
  end
end
