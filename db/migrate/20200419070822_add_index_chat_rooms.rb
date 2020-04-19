class AddIndexChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_index :chat_rooms, [:recipient_id, :sender_id], unique: true
  end
end
