class Company < ApplicationRecord
has_many :posts, dependent: :destroy
mount_uploader :profile_photo, ProfilePhotoUploader
has_secure_password
has_many :chat_rooms
end
