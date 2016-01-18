class AddCommentWhat < ActiveRecord::Migration
  def change
  	  	  	add_column :feeds, :comment_id, :integer

  end
end
