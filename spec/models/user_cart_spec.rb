require 'rails_helper'

RSpec.describe UserCart, type: :model do
  describe '#Cart' do 
    let(:user) { create(:user) }
    before(:each) do
      create(:user_cart, user: user)
    end

    it 'should have create cart to user' do
      expect(user.user_carts).to_not be_nil
    end

    it 'should have return total products in all carts' do
      user.user_carts.first.add_product(create(:product), 10)
      user.user_carts.first.add_product(create(:product), 2)
      expect(UserCart.quantity_products).to eq 12
    end

    it 'should have return total amount of money pending in all carts' do
      user.user_carts.first.add_product(create(:product, price: 24.99), 4)
      expect(UserCart.pending_amount).to eq 99.96
    end

    context 'when user add product' do
      it 'should have return product' do
        product = create(:product)
        user.user_carts.first.add_product(product, 20)
        expect(user.user_carts.first.cart_products.first.product).to eq product
      end

      it 'should have add same product twices' do
        product = create(:product, price: 20.00)
        user.user_carts.first.add_product(product, 10)
        user.user_carts.first.add_product(product, 20)
        expect(user.user_carts.first.total).to equal 600.00
      end

      it 'should have total to pay' do
        user.user_carts.first.add_product(create(:product, price: 99.99), 4)
        expect(user.user_carts.first.total).to eq 399.96
      end

      it 'should have list products' do
        user.user_carts.first.add_product(create(:product), 10)
        user.user_carts.first.add_product(create(:product), 20)
      end

      it 'should have return message if cart expired' do
        user.user_carts.first.update_attributes(updated_at: Time.now + 3.days)
        begin
          user.user_carts.first.add_product(create(:product), 10)
        rescue RuntimeError => e
          expect(e.message).to eq 'Cart expired'
        end
      end

      it 'should have return message if price product changed' do
        product = create(:product)
        user.user_carts.first.add_product(product, 10)
        product.price = 50
        product.save
        begin
          user.user_carts.first.add_product(product, 10)
        rescue RuntimeError => e
          expect(e.message).to eq "Products changed prices: #{product.name}"
        end
      end
    end

    context 'when user remove product' do
    end
  end
end
