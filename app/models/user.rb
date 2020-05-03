class User < ApplicationRecord
  has_many :chat_messages,dependent: :destroy
  has_many :chat_rooms
  has_many :likes
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }   
  validates :email, presence: true, length: { maximum: 50 }      
  validates :profile_photo, presence: true
  mount_uploader :profile_photo, ProfilePhotoUploader

  def like(post)
    likes << post
  end

  # マイクロポストをライク解除する
  def unlike(micropost)
    favorite_relationships.find_by(micropost_id: micropost.id).destroy
  end

  # 現在のユーザーがライクしていたらtrueを返す
  def likes?(post)
    likes.include?(post)
  end


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
