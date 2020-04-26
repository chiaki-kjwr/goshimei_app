require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  
  describe "index" do
  #ログイン済みユーザーであること
  context "as an authenticated user" do
    before do
       @user = User.create(
        name: "Joe",
        email: "joetester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze",
        id:1
        )
      end



   #正常にレスポンスを返すこと
    example "レスポンスが成功する" do
      get :index
      expect(response).to be_success
    end

    #200レスポンスを返すこと
    example "200レスポンスを返す" do
      get :index
      expect(response).to have_http_status "200"
    end



   
   

  end





end