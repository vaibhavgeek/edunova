class Stupid < ActiveRecord::Migration
  def change
  	rename_column :intrests, :name, :value
  end
end
