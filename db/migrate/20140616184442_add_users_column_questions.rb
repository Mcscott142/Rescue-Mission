class AddUsersColumnQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :user_id, :string
    add_column :answers, :user_id, :string
  end

  def down
    remove_column :questions, :user_id
    remove_column :answers, :user_id
  end
end
