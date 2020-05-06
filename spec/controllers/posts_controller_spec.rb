require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  
  describe "投稿一覧" do
  #ログイン済みユーザーであること
  context "ログイン済みのcompanyである" do
    before do
        @company = Company.create(
        name: "Joe",
        email: "joetester@example.com",
        password_digest: "password",
        profile_photo:"aaa.jpg"
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
  
  end
end
end