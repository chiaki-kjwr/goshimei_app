require 'rails_helper'
RSpec.describe Post, type: :model do
  it "is valid with a title,contents" do
        post = Post.new(
        title: "project",
        contents: "projectproject",
      )
       expect(post).to be_valid
  end
end
