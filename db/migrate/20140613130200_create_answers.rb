class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string  :body, null: false, minimum: 50

      t.timestamps
    end
  end
end
