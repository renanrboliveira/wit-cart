require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { Product.new }

  context 'when name and price is empty' do
    it 'should not be valid' do
      expect(product.valid?).to be false
    end

    it 'should have not save' do
      expect(product.save).to be false
    end
  end

  context 'when name and price is not empty' do
    let(:product) { Product.new(name: 'Learn RoR - Beginner', price: 24.99) }

    it 'should be valid' do
      expect(product.valid?).to be true
    end

    it 'should have save' do
      expect(product.save).to be true
    end
  end

  context 'when name is empty and price is not empty' do
    let(:product) { Product.new(price: 24.99) }

    it 'should not be valid' do
      expect(product.valid?).to be false
    end

    it 'should have not save' do
      expect(product.save).to be false
    end
  end
end
