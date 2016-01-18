class CrapSlugsHaveUnique < ActiveRecord::Migration
  def change
remove_column :notes, :slug
add_column :notes, :slug, :string
add_index :notes, :slug


  end
end
