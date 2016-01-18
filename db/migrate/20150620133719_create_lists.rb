class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :completed
      t.string :started
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
