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

    example "レスポンスが成功する" do
      get :index
      expect(response).to be_success
    end

    example "200レスポンスを返す" do
      get :index
      expect(response).to have_http_status "200"
    end
  
    #example "インスタンス変数" do

  
  end
end
end