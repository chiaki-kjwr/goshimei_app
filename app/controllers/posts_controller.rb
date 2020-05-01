class PostsController < ApplicationController
    before_action :current_company
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

    def index
        @search = Post.ransack(params[:q])
        @posts = @search.result
        #user = @post.user
       # @posts = Post.all.order('created_at DESC')
        #@user.profile_photo = User.profile_photo
        
    end

    def edit
    end

    def show
        @post = Post.find_by(id: params[:id])
    end



    private
    def post_params
        params.require(:post).permit(:contents,:title).merge(user_id: current_user.id)
    end

    def current_company
        @current_company ||= Company.find_by(id: session[:company_id])
    end
end
