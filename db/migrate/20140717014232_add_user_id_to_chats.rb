class AddUserIdToChats < ActiveRecord::Migration
  def change
    add_reference :chats, :user, index: true
  end
end
