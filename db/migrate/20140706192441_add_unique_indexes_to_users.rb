class AddUniqueIndexesToUsers < ActiveRecord::Migration
  def change
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :telephone, unique: true
    add_index :users, :picture, unique: true
  end
end
