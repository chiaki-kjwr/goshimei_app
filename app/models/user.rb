class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :chat_messages,dependent: :destroy
  has_many :chat_rooms
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }   
  validates :email, presence: true, length: { maximum: 50 }      
  validates :profile_photo, presence: true
   
  mount_uploader :profile_photo, ProfilePhotoUploader

  enum role: { user: 0, company: 1 } 

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
