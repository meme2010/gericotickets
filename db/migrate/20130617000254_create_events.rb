class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :total_number_of_tickets
      t.timestamps
    end
  end
end
