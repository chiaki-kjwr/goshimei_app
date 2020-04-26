require 'rails_helper'
RSpec.describe Post, type: :model do

  before do
    @user = User.create(
      name: "Joe",
      email: "joetester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      id:1
      )
  end

    example "ログインしているユーザーは新規投稿ができる" do
        post = Post.new(
        title: "project",
        contents: "projectproject",
        user_id:1
      )
        expect(post).to be_valid
    end

    example "titleとcontentsどちらも入力していないとエラーとなる" do
        post = Post.new(title: nil,contents:nil)
        post.valid?
        #expect(post.errors[:title]).to include("can't be blank")
        expect(post.errors.added?(:title, :blank)).to be_truthy
    end
    

    #検索結果についてのテスト
 





end
