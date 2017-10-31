class UserCart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def add_product(product, quantity)
    raise "Cart expired" if is_expired

    if products_changed_price.present?
      raise "Products changed prices: #{products_changed_price}"
    end

    cart_product = self.cart_products.where(product_id: product.id).first
    if cart_product.present?
      cart_product.quantity += quantity
      cart_product.save
    else
      self.cart_products << CartProduct.new(product: product, quantity: quantity, product_price: product.price)
    end
  end

  def total
    cart_products.includes(:product).sum("quantity * products.price").to_f
  end

  def self.quantity_products
    CartProduct.joins(:user_cart).sum("quantity").to_f
  end

  def self.pending_amount
    CartProduct.joins(:user_cart, :product).sum("quantity * products.price").to_f
  end

  private

  def update_products_price
    self.cart_products.map do |cart_product| 
      cart_product.product = cart_product.product.price
      cart_product.save
    end
  end

  def products_changed_price
    products = ""
    self.cart_products.map do |cart_product| 
      products << cart_product.product.name if cart_product.product_price != cart_product.product.price
    end
    products
  end

  def is_expired
    (self.updated_at - Time.current) > 2
  end
end
