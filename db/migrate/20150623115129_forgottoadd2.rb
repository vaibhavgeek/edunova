class Forgottoadd2 < ActiveRecord::Migration
  def change
  	 rename_column :notes, :from_id, :user_id

  end
end
