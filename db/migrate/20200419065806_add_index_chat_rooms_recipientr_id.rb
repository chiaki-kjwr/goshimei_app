class AddIndexChatRoomsRecipientrId < ActiveRecord::Migration[5.2]
  def change
    add_index :chat_rooms, :recipient_id
  end
end
