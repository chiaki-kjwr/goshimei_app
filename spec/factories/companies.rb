FactoryBot.define do
  factory :company do
    name {"Joe"}
    email  {"joetester@example.com"}
    password_digest {"password"} 
    profile_photo {"aaa.jpg"} 
  end
end