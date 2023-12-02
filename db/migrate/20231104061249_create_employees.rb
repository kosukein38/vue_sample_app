class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.string :tel
      t.integer :role
      t.string :url

      t.timestamps
    end
  end
end
