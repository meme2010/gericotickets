class CreatePayMents < ActiveRecord::Migration
  def change
    create_table :pay_ments do |t|

      t.timestamps
    end
  end
end
