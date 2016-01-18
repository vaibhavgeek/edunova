class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.integer :object_id
      t.string :type
      t.string :fcontent

      t.timestamps null: false
    end
  end
end
