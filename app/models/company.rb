class Company < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_secure_password
  validates :profile_photo, presence: true
  has_many :chat_rooms
  has_many :chat_messages, through: :chat_rooms, dependent: :destroy

def Company.search(search, company_or_post)
    if company_or_post == "1"
        Company.where(['name LIKE ?', "%#{search}%"])
    else
        Company.all
    end
  end

end
