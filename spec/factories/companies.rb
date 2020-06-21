FactoryBot.define do
  factory :company do
    id 1
    name { "Joe" }
    email { "joetester@example.com" }
    password_digest { "password" }
    #profile_photo {"#{Rails.root}/db/fixtures/guest.png"}
    profile_photo {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/guest.png'), 'guest/png') }
  end


end
