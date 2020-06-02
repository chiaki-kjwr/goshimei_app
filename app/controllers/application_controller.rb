class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id]) if session[:company_id]
  end

  def set_search
    @c_search = Company.ransack
    @search_companies = @c_search.result(distinct: true)
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

=begin   def search
    @company_or_post = params[:option]
    if @company_or_post == "1"
      @companies = Company.search(params[:search], @company_or_post)
    else
      @posts = Post.search(params[:search], @company_or_post)
    end
  end
=end



  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :sex, :profile, :profile_photo, :age]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  def login_required
    redirect_to new_company_path unless current_company
  end
end
