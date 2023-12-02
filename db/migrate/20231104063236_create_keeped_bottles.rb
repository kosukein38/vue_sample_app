class CreateKeepedBottles < ActiveRecord::Migration[7.1]
  def change
    create_table :keeped_bottles do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :bottle_number, null: false
      t.date :open_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
