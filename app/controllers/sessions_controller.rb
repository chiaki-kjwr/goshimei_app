class SessionsController < ApplicationController
  #skip_before_action :require_sign_in, only: [:new,:create]
  #skip_before_action :current_company, only: [:new,:create]

  def new
  end

  def create
    company = Company.find_by(email: session_params[:email])
    if company && company.authenticate(session_params[:password])
      session[:company_id] = company.id
      redirect_to root_path,notice: 'ログインに成功しました'
    else
      #redirect_to root_pat,hnotice: 'ログインに成功しました'
      render :new
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
