require 'rails_helper'
RSpec.describe Contact, type: :model do
  it "is valid with a name,email,contents" do
    contact = Contact.new(
    name:"Aaron",
    email: "tester@example.com",
    contents: "testtesttest"
  )
   expect(contact).to be_valid
  end
end