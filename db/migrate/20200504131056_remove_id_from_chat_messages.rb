class RemoveIdFromChatMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chat_messages, :user, foreign_key: true
    remove_reference :chat_messages, :company, foreign_key: true
  end
end
