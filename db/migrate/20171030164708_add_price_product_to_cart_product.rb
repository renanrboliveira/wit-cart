class AddPriceProductToCartProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_products, :price_product, :decimal, precision: 10, scale: 2
  end
end
