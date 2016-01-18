class CreaSlugUserIndex < ActiveRecord::Migration
  def change
  	     	  	  	add_index :users, :slug

  end
end
