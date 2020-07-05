class PostsController < ApplicationController
  include ApplicationHelper
  #before_action :set_search, only: [:index]
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result

    # q = params[:q]
    # @posts = Post.search(name_cont: q).result.page(params[:page]).per(9).order(id: "DESC")
    # これでいける？
    @posts = @posts.page(params[:page]).per(9).order(id: "DESC")
    @post = Post.find_by(id: params[:id])

    # チャット機能
    if user_signed_in?
      @companies = Company.all
      chat_rooms = current_user.chat_rooms
      @company_ids = []
      chat_rooms.each do |c|
        @company_ids << c.company_id
      end
    elsif company_signed_in?
      @users = User.all
      chat_rooms = current_company.chat_rooms
      # 自分が入ってるroomの相手のidを格納する
      @user_ids = []
      chat_rooms.each do |c|
        @user_ids << c.user_id
      end
    end

    respond_to do |format|
      format.html
      format.csv { send_data @posts.generate_csv, filename: "posts-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @company = @post.company
    @company_id = @post.company_id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to posts_path
      flash[:alert] = "ボシュウ開始されました！"
    else
      redirect_to new_post_path
      flash[:alert] = "ボシュウ投稿に失敗しました"
    end
  end

  def search
    @company_or_post = params[:option]
    if @company_or_post == "1"
      @companies = Company.search(params[:search], @company_or_post)
      @posts = Post.search(params[:search], @company_or_post)
      @companies_cnts = @companies.count
      @posts_cnts = @posts.count
    else @company_or_post == "2"
      @posts = Post.search(params[:search], @company_or_post)
      @companies = Company.search(params[:search], @company_or_post)
      @posts_cnts = @posts.count
      @companies_cnts = @companies.count
    end
  end

    def likes
      @posts = current_user.like_posts
    end

    def logged_in_company
      if @current_company == nil
        redirect_to companies_home_path
        flash[:alert] = "ログインしてください"
      else
        redirect_to new_post_path
      end
    end

  private

  def post_params
    params.require(:post).permit(:contents, :title).merge(company_id: current_company.id)
  end


end
