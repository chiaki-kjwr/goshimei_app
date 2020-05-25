class Company < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_secure_password
  validates :profile_photo, presence: true
  has_many :chat_rooms
  has_many :chat_messages, through: :chat_rooms, dependent: :destroy
end
