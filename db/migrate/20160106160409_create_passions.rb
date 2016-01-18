class CreatePassions < ActiveRecord::Migration
  def change
    create_table :passions do |t|
      t.integer :user_id
      t.string :video_url
      t.string :label

      t.timestamps null: false
    end
  end
end
