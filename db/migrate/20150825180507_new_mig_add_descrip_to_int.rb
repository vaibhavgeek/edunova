class NewMigAddDescripToInt < ActiveRecord::Migration
  def change
  	  	add_column :intrests, :about, :string
  end
end
