FactoryBot.define do
  factory :company do
    name {"Joe"}
    email  {"joetester@example.com"}
    password_digest {"password"} 
    profile_photo {"company.jpg"} 
  end
end