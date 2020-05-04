class AddIsUserToChatMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_messages, :is_user, :boolean,default: true, null: false
  end
end
