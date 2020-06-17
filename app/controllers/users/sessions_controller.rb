class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.find_by(email: "guest@example.com",name:"guest-user")
    sign_in user
    redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end


=begin   def self.guest
    find_or_create_by!(email: "guest@example.com",name:"guest-user") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
=end

end