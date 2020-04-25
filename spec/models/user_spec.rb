require 'rails_helper'



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