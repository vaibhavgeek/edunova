class AddNumberOfLevelsNotes < ActiveRecord::Migration
  def change
  	  	  	  	add_column :notes, :total_levels, :integer

  end
end
