class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @company_name = @company.name
    post.company_id = @post.company_id
  end

  def create
    company = Company.new(company_params)
    company.save!
    redirect_to posts_path,notice: 'ユーザー登録が完了しました'
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path,notice: 'ユーザー情報を更新しました'
  end

  private

  def company_params
    params.require(:company).permit(:name,:email,:profile_photo,:profile,:password,:password_confirmation)
  end

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end

end
