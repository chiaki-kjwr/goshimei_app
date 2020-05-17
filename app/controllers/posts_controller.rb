class PostsController < ApplicationController
    include ApplicationHelper

    #before_action :login_required
    def index
        @user = User.find_by(id: params[:id])
        @search = Post.ransack(params[:q])
        @posts = @search.result

        q = params[:q]
        @posts = Post.search(name_cont: q).result.page(params[:page]).per(9).order(id: "DESC")
        @companies = Company.search(name_cont: q).result

        #post.company = @post.cpmpany

        #チャット機能
        if  user_signed_in?
                @companies = Company.all
                chat_rooms = current_user.chat_rooms
                @company_ids = []
                chat_rooms.each do |c|
                @company_ids << c.company_id
                end
        elsif company_signed_in?
                @users = User.all
                chat_rooms = current_company.chat_rooms
                #自分が入ってるroomの相手のidを格納する
                @user_ids = []
                chat_rooms.each do |c|
                    @user_ids << c.user_id
                end
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
        if  @post.save!
            redirect_to posts_path
            flash[:alert] = "ボシュウ開始されました！"
        else
            redirect_to new_post_path
            flash[:alert] = "投稿に失敗しました"
        end
    end

    def liked_by(current_user)
        Like.find_by(user_id: user.id, post_id: post.id)
    end

    def likes
        @posts = current_user.like_posts
    end

    private
    def post_params
        params.require(:post).permit(:contents,:title).merge(company_id: current_company.id)
    end

    #def current_company
        #@current_company ||= Company.find_by(id: session[:company_id])
    #end
end
