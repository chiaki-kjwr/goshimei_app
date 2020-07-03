class User < ApplicationRecord
  has_many :chat_messages, through: :chat_rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :chat_rooms, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, :omniauth_providers => [:google_oauth2]
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :profile_photo, presence: true
  #validates :test1, presence: true
  mount_uploader :profile_photo, ProfilePhotoUploader
  enum confirmation: { yes: true, no: false }
  validates :confirmation, inclusion: {in: ["yes", "no"]}

  def like(post)
    likes << post
  end

  def unlike(micropost)
    favorite_relationships.find_by(micropost_id: micropost.id).destroy
  end

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end


end
