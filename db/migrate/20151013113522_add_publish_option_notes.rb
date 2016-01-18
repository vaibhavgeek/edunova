class AddPublishOptionNotes < ActiveRecord::Migration
  def change
  	  	  	  	  	add_column :notes, :publish, :integer

  end
end
