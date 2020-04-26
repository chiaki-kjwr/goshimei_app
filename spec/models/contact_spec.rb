require 'rails_helper'
RSpec.describe Contact, type: :model do

  it "name、email、contentsがあれば問合せを送ることができる" do
    contact = Contact.new(
    name:"Aaron",
    email: "tester@example.com",
    contents: "testtesttest"
  )
   expect(contact).to be_valid
  end
end