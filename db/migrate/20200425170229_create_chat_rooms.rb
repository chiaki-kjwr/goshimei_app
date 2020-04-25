class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :messeage
      t.references :user, foreign_key: true
      t.references :chat_room, foreign_key: true
    end
  end
end
