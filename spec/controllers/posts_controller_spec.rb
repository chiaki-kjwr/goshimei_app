require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  
  describe "GET #index" do
  #ログイン済みユーザーであること
  context "ログイン済みのcompanyである" do 
    
    #before do
        #@company = Company.create(
        #name: "Joe",
        #email: "joetester@example.com",
        #password_digest: "password",
        #profile_photo:"aaa.jpg"
        
    #end
    before do
      @company = FactoryBot.build(:company) 
    end

    example "レスポンスが成功する" do
      #sign_in @company
      get :index
      expect(response).to be_success
    end

    example "200レスポンスを返す" do
      get :index
      expect(response).to have_http_status "200"
    end

    describe "GET #new" do

    end
  end
  end
end
