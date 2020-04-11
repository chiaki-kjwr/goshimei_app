class ChatRoomUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :chat_room_users
  end
end
