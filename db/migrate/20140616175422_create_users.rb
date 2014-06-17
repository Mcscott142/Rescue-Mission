class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: true
      t.integer :uid, null: true
      t.string :name, null: true
    end
  end
end
