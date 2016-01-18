class TypeMistakeChange < ActiveRecord::Migration
  def change
  	rename_column :feeds, :type, :set_type

  end
end
