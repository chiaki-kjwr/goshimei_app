require 'rails_helper'
describe Post, type: :model do
  before do
    company = Company.create(
      name: "Joe",
      email: "joetester@example.com",
      password_digest: "password",
      id: 1
    )
    post = company.post.create(
      title: "Test",
      contents: "testtesttest"
    )
  end

  example "ログインしているcompanyは新規投稿ができる" do
    # post = Post.new(
    # title: "project",
    # contents: "projectproject"
    # )
    company.post.create
    expect(post).to be_valid
  end

  example "titleとcontentsどちらも入力していないとエラーとなる" do
    post = Post.new(title: nil, contents: nil)
    post.valid?
    # expect(post.errors[:title]).to include("can't be blank")
    expect(post.errors.added?(:title, :blank)).to be_truthy
  end

  # 検索結果についてのテスト
end
