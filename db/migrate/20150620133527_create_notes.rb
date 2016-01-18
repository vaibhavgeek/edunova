class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :description
      t.text :note_from_author
      t.integer :comments_id
      t.integer :spam_count
      t.string :prereq
      t.string :file
      t.integer :list_count_id

      t.timestamps null: false
    end
  end
end
