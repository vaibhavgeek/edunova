class NewMigAddCountToInt < ActiveRecord::Migration
  def change
  	add_column :intrests, :trend_count, :integer
  end
end
