require 'rails_helper'
RSpec.describe Contact, type: :model do
  example "name、email、contentsがあれば問合せを送ることができる" do
    contact = Contact.new(
      name: "Aaron",
      email: "tester@example.com",
      contents: "testtesttest"
    )
    expect(contact).to be_valid
  end

  example "contentsが無いと有効ではない" do
    contact = Contact.new(contents: nil)
    contact.valid?
    expect(contact.errors[:contents]).not_to include("can't be blank")
  end

  example "nameが無いと有効ではない" do
    contact = Contact.new(name: nil)
    contact.valid?
    expect(contact.errors[:name]).not_to include("can't be blank")
  end

  
end
