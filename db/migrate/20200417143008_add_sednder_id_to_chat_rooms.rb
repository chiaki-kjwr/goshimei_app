class AddSednderIdToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :sender_id, :integer,index: true
  end
end
