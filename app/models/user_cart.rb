# This class represents an user cart
# @author Renan Oliveira - <a href="http://www.renanol.me/">www.renanol.me</a>
# @since 30/10/17
class UserCart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def add_product(product, quantity)
    validates_add_product

    cart_product = find_cart_product(product)
    if cart_product.present?
      cart_product.quantity += quantity
      cart_product.save
    else
      cart_products << CartProduct.new(product: product,
                                       quantity: quantity,
                                       product_price: product.price)
    end
  end

  def total
    cart_products.includes(:product).sum('quantity * products.price').to_f
  end

  def self.quantity_products
    CartProduct.joins(:user_cart).sum('quantity').to_f
  end

  def self.pending_amount
    CartProduct.joins(:user_cart, :product).sum('quantity * products.price').to_f
  end

  private

  def validates_add_product
    raise 'Cart expired' if expired?
    raise "Products changed prices: #{products_changed_price}" if products_changed_price.present?
  end

  def find_cart_product(product)
    cart_products.where(product_id: product.id).first
  end

  def update_products_price
    cart_products.map do |cart_product|
      cart_product.product = cart_product.product.price
      cart_product.save
    end
  end

  def products_changed_price
    products = ''
    cart_products.map do |cart_product|
      products << cart_product.product.name if cart_product.product_price != cart_product.product.price
    end
    products
  end

  def expired?
    (updated_at - Time.current) > 2
  end
end
