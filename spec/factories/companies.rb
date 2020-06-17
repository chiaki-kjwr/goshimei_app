FactoryBot.define do
  factory :company do
    name { "Joe" }
    email { "joetester@example.com" }
    password_digest { "password" }
    #profile_photo { "company.jpg" }
    profile_photo {"#{Rails.root}/db/fixtures/guest.png"}
  end


end
