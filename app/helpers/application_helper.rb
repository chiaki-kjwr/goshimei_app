module ApplicationHelper
  def avatar_url(user)
        return user.profile_photo unless user.profile_photo.nil?
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_company
      @current_company ||= Company.find_by(id: session[:company_id])
  end

  def company_signed_in?
    @current_company.present?
  end

  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
  
end
