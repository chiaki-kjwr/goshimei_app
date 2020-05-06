require 'rails_helper'
describe "投稿機能", type: :system do
  describe "companyモデルの投稿が一覧で表示される"do
    before do
    company_a = FactoryBot.create(:company,name:"Joe",email:"joetester@example.com",password:"password")
    FactoryBot.create(:post,title:"test",contents:"testtesttest",company:"company_a")
    end
  end

  context "companyがログインしている場合" do
    before do
    visit login_path
    #fill_in "メールアドレス",with: "joetester@example.com"
    fill_in "email" , with: "session[email]"
    fill_in "パスワード",with:"password"
    lick_button  "ログインする"
    end

    example "companyが作成した投稿が表示される" do
    expect(page).to have_content "ボシュウ"
    end
  end
end

