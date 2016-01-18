class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :user_id
      t.integer :note_id
      t.integer :p_count
      t.integer :current_level

      t.timestamps null: false
    end
  end
end
