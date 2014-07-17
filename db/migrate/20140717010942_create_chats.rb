class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :body

      t.timestamps
    end
  end
end
