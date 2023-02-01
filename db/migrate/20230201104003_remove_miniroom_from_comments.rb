class RemoveMiniroomFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :miniroom, null: false, foreign_key: true
  end
end
