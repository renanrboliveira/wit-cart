class CreateUserCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_carts do |t|
      t.references :user, foreign_key: true
      t.date :expiry_date

      t.timestamps
    end
  end
end
