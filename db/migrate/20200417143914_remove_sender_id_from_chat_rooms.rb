class RemoveSenderIdFromChatRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_rooms, :sender_id, :integer
  end
end
