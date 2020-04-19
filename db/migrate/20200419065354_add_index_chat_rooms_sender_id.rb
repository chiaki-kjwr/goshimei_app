class AddIndexChatRoomsSenderId < ActiveRecord::Migration[5.2]
  def change
    add_index :chat_rooms, :sender_id
  end
end
