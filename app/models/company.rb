class Company < ApplicationRecord
has_many :posts, dependent: :destroy
mount_uploader :profile_photo, ProfilePhotoUploader
end
