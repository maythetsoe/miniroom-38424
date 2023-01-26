class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_id, null: false
      t.integer :region_id, null: false
      t.integer :ship_id, null: false
      t.integer :size_id, null: false
      t.timestamps
    end
  end
end
