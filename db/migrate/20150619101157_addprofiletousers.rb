class Addprofiletousers < ActiveRecord::Migration
 
  	def change
    add_column :users, :image_id, :string
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :intrested_in, :string
    add_column :users, :description, :string
    add_column :users, :dob, :date

  end

end