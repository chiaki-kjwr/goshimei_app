require 'rails_helper'
RSpec.describe CompaniesController, type: :controller do
  let!(:company) { FactoryBot.create(:company) }

  describe "GET #new" do
    # ログイン済みcompanyであること

    example "新しいCompanyオブジェクトがビューに渡されること" do
      expect(assigns(:company)).to be_a_new Company
    end

  end

  describe "Post #create" do

    example "データベースに保存される" do
    expect{
      company :create, company: attributes_for(:company)
    }.to change(Company, :count).by(1)
    end

    example "投稿作成ページにリダイレクトする" do
      company.save!
      expect(current_path).to eq(new_posts_path)
    end

    describe "GET #show" do
      it "assigns the requested article to @article" do

        get :show
        expect(assigns(:company)).to eq company
      end
    end


  end
end
