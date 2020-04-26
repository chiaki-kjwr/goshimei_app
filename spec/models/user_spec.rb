require 'rails_helper'

　　RSpec.describe User, type: :model do

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