class CreateBottles < ActiveRecord::Migration[7.1]
  def change
    create_table :bottles do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :category
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
