class CartProduct < ApplicationRecord
  belongs_to :user_cart
  belongs_to :product
end
