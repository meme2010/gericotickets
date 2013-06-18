class CreatePayMents < ActiveRecord::Migration
  def change
    create_table :pay_ments do |t|
    	t.integer :event_id
      t.integer :user_id
      t.integer :shopcart_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
