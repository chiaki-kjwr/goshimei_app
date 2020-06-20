class AddDetailsToChatMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_messages, :created_at, :datetime, null: true
    add_column :chat_messages, :updated_at, :datetime, null: true
  end
end
