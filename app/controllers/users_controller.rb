class UsersController < ApplicationController

def index
  @q = current_user.posts.ransack(params[:q])
  @users = @q.result(distinct: true).recent
end


def show
  @user = User.find_by(id: params[:id])
  
end

end
