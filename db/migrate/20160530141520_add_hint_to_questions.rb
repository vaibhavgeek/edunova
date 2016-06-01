class AddHintToQuestions < ActiveRecord::Migration
  def change
  	add_column :notequestions, :hint, :string
  	add_column :notequestions, :solution_explain, :string


  end
end
