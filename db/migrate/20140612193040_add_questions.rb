class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, minimum: 40
      t.string :description, null: false, minimum: 150


      t.timestamps
    end
  end
end
