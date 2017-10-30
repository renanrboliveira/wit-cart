require 'rails_helper'

RSpec.describe UserCart, type: :model do
  describe "#Cart" do 
    let(:user) { build(:user) } 
    let(:product) { build(:product) }
    
    it "should have create cart to user" do 
    end
    
    context "when user add product " do
      it("should have return product") do
      end
      it("should have add another product") do
      end
      it("should have total to pay") do
      end
      it("should have remove product") do
      end
    end

    context "when user remove product " do
    end
  end
end
