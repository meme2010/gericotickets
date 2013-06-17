class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :titel
      t.string :text
      t.integer :tickets

      t.timestamps
    end
  end
end
