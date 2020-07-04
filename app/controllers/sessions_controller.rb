class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create], raise: false
  # before_action :login_required

  def new
  end

  def create
    company = Company.find_by(email: session_params[:email])
    if company &.authenticate(session_params[:password])
      session[:company_id] = company.id
      redirect_to company_path(company), notice: 'ログインに成功しました'
    else
      redirect_to login_path ,notice: 'ログインに失敗しました'
    end
  end

  def destroy
    reset_session
    redirect_to companies_home_path, notice: 'ログアウトしました'
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def login_required
    redirect_to login_path # unless current_company
  end

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end
end
