require 'rails_helper'

RSpec.describe Post, type: :model do
  it "does not allow duplicate post names per user" do
    user = User.create(
    name: "Joe",
    email: "joetester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    )
    
    user.posts.create(
    title: "Test Project",
    )
    new_post = user.posts.build(
    title: "Test Project",
    )
    new_post.valid?
    expect(new_post.errors[:title]).to include("has already been taken")
  end
  it "does not allows two users to share a post name" do
    user = User.create(
    name: "Joe",
    email: "joetester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    )

    user.posts.create(
    title: "Test Project",
    )

    other_user = User.create(
    name: "Jane",
    email: "janetester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    )

    other_post = other_user.posts.build(
    title: "Test Project",
    )

    expect(other_project).to be_valid
  end
end