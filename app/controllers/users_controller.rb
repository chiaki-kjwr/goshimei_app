class UsersController < ApplicationController

def index
  @users = User.all
  @q = User.ransack(params[:q])
  @users = @q.result(distinct: true)
end


def show
  @user = User.find_by(id: params[:id])
end

end
