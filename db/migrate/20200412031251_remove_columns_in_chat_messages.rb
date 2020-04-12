class RemoveColumnsInChatMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_messages, :user_id, :integer
    remove_column :chat_messages, :chat_room_id, :integer
  end
end
