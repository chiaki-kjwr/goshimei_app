class AddRecipientIdToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :recipient_id, :integer
  end
end
