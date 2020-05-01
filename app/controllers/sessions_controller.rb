class SessionsController < ApplicationController
  #skip_before_action :require_sign_in, only: [:new,:create]
  #skip_before_action :current_company, only: [:new,:create]

  def new
  end

  def create
    company = Company.find_by(email: params[:session][:email].downcase)
    #if company && company.authenticate(params[:session])
    if @company
      session[:user_id] = @user.id
      log_in company
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end


  private 
  def session_params
      params.require(:session).permit(:name,:email)
  end

end
