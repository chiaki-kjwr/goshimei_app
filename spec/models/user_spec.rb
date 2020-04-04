require 'rails_helper'
RSpec.describe User, type: :model do
    it "is valid with a name,email,password" do
      user = User.new(
      name:"Aaron",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
     expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end

    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end

end