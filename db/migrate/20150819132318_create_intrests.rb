class CreateIntrests < ActiveRecord::Migration
  def change
    create_table :intrests do |t|
      t.string :name
      t.integer :user_id
      t.integer :edunova_cert
      t.string :media

      t.timestamps null: false
    end
  end
end
