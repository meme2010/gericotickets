class CreatePayMents < ActiveRecord::Migration
  def change
    create_table :paymments do |t|
    	t.integer :event_id
      t.integer :user_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
