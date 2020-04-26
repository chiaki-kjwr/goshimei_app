require 'rails_helper'

　　RSpec.describe User, type: :model do

  describe "presence" do
    example "ユーザーの名前が無いと、有効なデータではない" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end

    example "ユーザーのメールアドレスが無いと、有効なデータではない" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end

    example "ユーザーのプロフィール写真が無いと、有効なデータではない" do
      user = User.new(profile_photo: nil)
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end
  
  end
  
  describe "update_without_current_password" do
   context "user編集時にパスワードを入力しない場合" do
   example "userはプロフィール情報を編集できる" do
    user =User.new(password:nil)
    user.update
    user.valid?




  end
end
end 

#userは複数のpostを持っている
describe "postとのアソシエーション" do
  context "userが破棄される場合" do
    example "postも破棄される" do
    




    #userが破棄されるとpostも破棄される
    describe "postとのアソシエーション" do
      context "userが破棄される場合" do
        example "postも破棄される" do
        　user.destroy
          #expect(my_posts).not_to be_empty
          user.osts.each do |post|
          expect(Post.where(id: post.id)).to be_empty
          end
        end
      end   
    end



end