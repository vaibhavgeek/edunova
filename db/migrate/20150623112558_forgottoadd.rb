class Forgottoadd < ActiveRecord::Migration
  def change
  	  	    add_column :notes, :from_id, :integer

  end
end
