class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    company = Company.new(company_params)
    company.save!
    redirect_to root_path,notice: 'ユーザー登録が完了しました'
  end

  private

  def company_params
    params.require(:company).permit(:name,:email,:profile_photo)
  end

end
