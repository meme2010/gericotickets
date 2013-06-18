class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :event_id
      t.integer :user_id
      t.datetime :expires_at
      t.integer :number_of_tickets
      t.timestamps
    end
  end
end
