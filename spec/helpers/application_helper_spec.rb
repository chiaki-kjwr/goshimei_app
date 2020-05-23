require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title_helper" do
    example "ページタイトルが指定されていない時、ベースタイトルのみを返す" do
      expect(full_title("")).to eq "ゴシメイ！"
    end

    example "ページタイトルがnilの時、ベースタイトルのみを返す" do
      expect(full_title(nil)).to eq "ゴシメイ！"
    end

    example "ページタイトルが指定されている時、ページタイトルとベースタイトルを返す" do
      expect(full_title("ページタイトル")).to eq "ページタイトル - ゴシメイ！"
    end
  end
end
