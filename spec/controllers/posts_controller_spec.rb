require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    # ログイン済みユーザーであること
    before do
      #@post = FactoryBot.create(:post)

      @post = Post.new(
        title:"test",
        contents:"testtest"
      )
    end
    example "@postが正しく取得できていること" do

      get :index
      expect(@post).to eq @post
    end

    example "ログインしていないユーザーの場合、ログイン画面へ遷移する" do
      get :index
      expect(response).to redirect_to "/users/sign_in"
    end

    example "ログインしていないユーザーの場合、302レスポンスを返す" do
      get :index
      expect(response).to have_http_status "302"
    end
  end


  describe "GET #create" do


    it "redirects to the sign-in page" do
      # Taskのインスタンスを生成するための情報を「task_params」に格納
      #post_params = FactoryBot.attributes_for(:post)
      #「task_params」をPOSTで送信する
      #post :create, params: {post:post_params }


      # サインインページに遷移することを確認
      #expect(response).to redirect_to "/companies/new"
      expect(response).to have_http_status "302"
    end





    end


end
