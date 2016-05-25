class CreateNotearticles < ActiveRecord::Migration
  def change
    create_table :notearticles do |t|
      t.integer :note_id
      t.text :content

      t.timestamps null: false
    end
  end
end
