class CreateChatMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.references :user,foreign_key: true
      t.references :chat_room,foreign_key: true
      t.references :company,foreign_key: true
    end
  end
end