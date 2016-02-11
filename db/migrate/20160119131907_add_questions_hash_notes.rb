class AddQuestionsHashNotes < ActiveRecord::Migration
  def change
  	  	  	add_column :notes, :questions, :string

  end
end
