class ChatRoom < ApplicationRecord
  has_many :chat_messages,dependent: :destroy
  belongs_to :user
  belongs_to :company
end