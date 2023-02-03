class CreateMinirooms < ActiveRecord::Migration[6.0]
  def change
    create_table :minirooms do |t|
      t.string :title
      t.text :concept
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
