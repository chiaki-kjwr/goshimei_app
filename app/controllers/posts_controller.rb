class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "募集開始されました！"
            redirect_to root_path
          else
            flash[:danger] = "投稿に失敗しました"
            redirect_to root_path
          end
    end

    def index
        @posts = Post.includes(:company).order('created_at DESC')


    end


    private
    def post_params
        params.require(:post).permit(:contents).merge(company_id: current_company.id)
    end

end
