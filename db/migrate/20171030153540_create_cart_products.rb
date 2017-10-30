class CreateCartProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_products do |t|
      t.references :user_cart, foreign_key: true
      t.integer :quantity
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
