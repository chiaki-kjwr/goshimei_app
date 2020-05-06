class Company < ApplicationRecord
has_many :posts, dependent: :destroy
mount_uploader :profile_photo, ProfilePhotoUploader
has_secure_password
has_many :chat_rooms
validates :profile_photo, presence: true
end
