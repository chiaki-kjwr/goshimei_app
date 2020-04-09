class AddUserIdToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :user_id, :integer
  end
end
