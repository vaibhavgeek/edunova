class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :read
      t.integer :from_id
      t.integer :to_id
      t.integer :person3_id
      t.string :type
      t.string :content
      t.integer :object_id
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
