class AddSlugToNotes < ActiveRecord::Migration
  def change
  	  	  	  	  	  	add_column :notes, :slug, :integer

  end
end

