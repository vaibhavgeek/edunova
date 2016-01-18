class AddOmniauthFirstTime < ActiveRecord::Migration
  def change
      	  	  	  	add_column :users, :first_time_omniauth, :integer

  end
end
