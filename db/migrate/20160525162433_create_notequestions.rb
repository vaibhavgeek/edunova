class CreateNotequestions < ActiveRecord::Migration
  def change
    create_table :notequestions do |t|
      t.integer :note_id
      t.text :question_text
      t.text :option1
      t.text :option2
      t.text :option3
      t.text :option4
      t.text :correct_answer

      t.timestamps null: false
    end
  end
end
