class PostsController < ApplicationController
    def new
        @post = Post.new
      
       
    end

    def create
        @post = Post.create(post_params)
        if  @post.save
            flash[:success] = "ボシュウ開始されました！"
            redirect_to root_path
          else
            flash[:danger] = "投稿に失敗しました"
            redirect_to root_path
        end
    end

    def index
        @posts = Post.all
        
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
end
