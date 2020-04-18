class RemoveUserIdFromChatRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chat_rooms, :user, index: true,foreign_key: true
  end
end
