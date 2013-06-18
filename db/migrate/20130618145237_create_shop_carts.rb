class CreateShopCarts < ActiveRecord::Migration
  def change
    create_table :shop_carts do |t|
      t.integer :event_id
      t.integer :user_id
      t.datetime :expires_at
      t.integer :number_of_tickets
      t.integer :reservation_id
      t.timestamps
    end
  end
end
