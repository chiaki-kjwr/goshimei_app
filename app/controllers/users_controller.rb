class UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @user = User.find_by(id: params[:id])
end

def destroy 
  @user = User.find_by(id: params[:id])
  @user.destroy
  flash[:success] = "アカウントが削除されました"
  redirect_to("/")
end

end
