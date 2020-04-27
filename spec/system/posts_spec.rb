require 'rails_helper'
describe "投稿機能", type: system do
  describe "投稿が一覧で表示される"do
　before do
  user = FactoryBot.create(:user,name:"Joe",email:"joetester@example.com",password:"password")
  FactoryBot.create(:post,title:"test",contents:"testtesttest")
end

 context "userがログインしている場合"do
 before do
 visit login_path
 fill_in "メールアドレス",with "joetester@example.com"
 fill_in"パスワード",with"password"
click_button"ログインする"

 example"userが作成したタスクが表示される" do


   
 end
 

end

  





end

  