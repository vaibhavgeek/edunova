class CreateNoteapplets < ActiveRecord::Migration
  def change
    create_table :noteapplets do |t|
      t.integer :note_id
      t.text :content

      t.timestamps null: false
    end
  end
end
