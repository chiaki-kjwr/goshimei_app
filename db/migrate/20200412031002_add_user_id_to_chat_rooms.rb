class AddUserIdToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :user, foreign_key: true
  end
end
