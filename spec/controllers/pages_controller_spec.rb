require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  describe "GET /" do
    example "ルートページへのGETリクエストでhomeのビューが表示される" do
      expect(response).to be_successful
    end

    example "200レスポンスを返す" do
      expect(response).to have_http_status "200"
    end

  end
end
