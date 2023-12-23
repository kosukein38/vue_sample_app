class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :tel
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end
