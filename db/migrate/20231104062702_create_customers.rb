class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :age
      t.date :last_visit_date
      t.string :avater
      t.text :memo

      t.timestamps
    end
  end
end
