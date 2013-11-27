class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :github_id
      t.string :username
      t.string :email
      t.integer :longest_streak

      t.timestamps
    end
  end
end
