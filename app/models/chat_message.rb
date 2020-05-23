class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  # belongs_to :user

  # def message_time
  # created_at.strftime("%m%d%y at %l:%M %p")
  # end
end
