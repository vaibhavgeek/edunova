class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :description
      t.integer :note_id
      t.integer :user_id
      t.integer :level
      t.integer :order
      t.integer :answer
      t.string :solution

      t.timestamps null: false
    end
  end
end
