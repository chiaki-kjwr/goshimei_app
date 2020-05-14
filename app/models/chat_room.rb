class ChatRoom < ApplicationRecord
  has_many :chat_messages,dependent: :destroy
  belongs_to :user
  belongs_to :company
  #has_one :posts. through: :companies
  #has_many :posts, through: :companies


end