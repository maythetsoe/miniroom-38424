class CreateMiniroomfavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :miniroomfavorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :miniroom, null: false, foreign_key: true
      t.timestamps
    end
  end
end
