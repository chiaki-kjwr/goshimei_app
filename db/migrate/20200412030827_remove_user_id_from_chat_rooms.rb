class RemoveUserIdFromChatRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_rooms, :user_id, :integer
  end
end