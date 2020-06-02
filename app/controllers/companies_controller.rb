class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @company_name = @company.name
    @post = Post.find(params[:id])
    #@user = current_user

    if user_signed_in?
      @companies = Company.all
      chat_rooms = current_user.chat_rooms
      @chat_room_id = current_user.chat_rooms.find_by(company_id: @post.company_id)
      # 自分が入ってるroomの相手のidを格納する
      @company_id = @post.company_id
      @company_ids = []
      chat_rooms.each do |c|
        @company_ids << c.company_id
      end
    end
  end

  def create
    company = Company.new(company_params)
    company.save!
    redirect_to posts_path, notice: 'ユーザー登録が完了しました'
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path, notice: 'ユーザー情報を更新しました'
  end

  def set_search
    @c_search = Company.ransack(params[:c], search_key: :c)
    @companies = @c_search.result(distinct: true)
  end
end

private

def company_params
  params.require(:company).permit(:name, :email, :profile_photo, :profile, :password, :password_confirmation)
end

def current_company
  @current_company ||= Company.find_by(id: session[:company_id])
end
