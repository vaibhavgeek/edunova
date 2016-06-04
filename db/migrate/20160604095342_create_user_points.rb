class CreateUserPoints < ActiveRecord::Migration
  def change
    create_table :user_points do |t|
      t.text :grit
      t.text :speed
      t.text :consistency
      t.text :passion
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
