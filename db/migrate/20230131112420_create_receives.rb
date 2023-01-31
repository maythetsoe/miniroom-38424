class CreateReceives < ActiveRecord::Migration[6.0]
  def change
    create_table :receives do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :donation,    null: false, foreign_key: true
      t.string     :post_code,   null: false
      t.integer    :region_id,    null: false
      t.string     :city,   null: false
      t.string     :address,   null: false 
      t.string     :phone_num,   null: false 
      t.timestamps
    end
  end
end