# #ログインしていないとお気に入りできないようになってる。
require 'rails_helper'
RSpec.describe Like, type: :model do
  describe  '正常系の機能'  do

    example "user_idがnilの場合、お気に入り登録ができない" do
      like = Like.new(user_id: nil)
      expect(like).not_to be_valid
    end

    example "1つの投稿に１度のみお気に入り登録ができる" do
      like = Like.new(
        post_id: 1,
        user_id:1
      )
      duplicate_like=  like = Like.new(
        post_id: 1,
        user_id:1
      )
      expect(duplicate_like).to be_invalid
    end
  end
end