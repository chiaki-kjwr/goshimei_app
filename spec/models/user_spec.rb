require 'rails_helper'



    it "ユーザーの名前が無いと、有効なデータではない" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end

    it "ユーザーのメールアドレスが無いと、有効なデータではな" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end

    it "ユーザーのプロフィール写真が無いと、有効なデータではな" do
      user = User.new(profile_photo: nil)
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end

    


end