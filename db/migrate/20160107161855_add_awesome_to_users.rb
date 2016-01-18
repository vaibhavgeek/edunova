class AddAwesomeToUsers < ActiveRecord::Migration
  def change
  	      remove_column :users, :first_time_omniauth, :integer
      	  add_column :users, :awesome, :integer

  end
end
