class CartProduct < ApplicationRecord
  belongs_to :user_cart
  belongs_to :product

  def sub_total
    self.quantity * self.product.price 
  end
end
