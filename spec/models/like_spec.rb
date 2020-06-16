# #ログインしていないとお気に入りできないようになってる。
require 'rails_helper'
RSpec.describe Like, type: :model do
  describe  '異常系の機能'  do
    example "ユーザーのidが無いと、お気に入りができない" do
      like = Like.new(user_id: nil)
      user.valid?
      expect(user.errors[:email]).not_to include("can't be blank")
    end
  end

end