class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :chat_messages
  has_many :chat_room_users
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }   
  validates :email, presence: true, length: { maximum: 50 }      
  #mount_uploader :img_name, ImgNameUploader   
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
