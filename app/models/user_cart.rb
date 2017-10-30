class UserCart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  scope :expired, -> { where('updated_at < ?', Time.now - 2.days)}  

  def add_product(product, quantity)
    puts expired
    self.cart_products.create(product: product, quantity: quantity)
  end

  def total
    self.cart_products.inject(0) do |acum, cart_product|
      acum + cart_product.sub_total
    end
  end

  private 

  def expired
  end
end
