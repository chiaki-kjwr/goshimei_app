class CreateChatRoom < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.references :user,foreign_key: true
      t.references :company,foreign_key: true
    end
  end
end
