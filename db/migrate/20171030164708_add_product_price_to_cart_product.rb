class AddProductPriceToCartProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_products, :product_price, :decimal, precision: 10, scale: 2
  end
end
