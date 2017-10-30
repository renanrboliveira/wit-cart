require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.new }

  context "when name is empty" do
    it "should not be valid" do
      expect(user.valid?).to be false
    end

    it "should have not save" do
      expect(user.save).to be false
    end
  end

  context "when name is not empty" do
    let (:user) { User.new(name: "Diogo") }

    it "should be valid" do
      expect(user.valid?).to be true
    end

    it "should have save" do
      expect(user.save).to be true
    end
  end
end
