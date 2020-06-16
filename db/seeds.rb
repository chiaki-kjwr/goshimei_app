1.upto(10) do |n|
  Company.create!(
    email: "email#{n}@example.com",
    name: "#{n}名前",
    profile_photo: open("#{Rails.root}/db/fixtures/test.JPG"),
    profile:"#{n}test",
    password_digest:"#{n}test",
    industry:"#{n}test",
    occupation:"#{n}test",
    corporation_name:"#{n}test"
  )
end

=begin
if Rails.env == "production"
User.create!(
email: "guest@example.com",
id:5,
name: "guest-user",
profile_photo: open("#{Rails.root}/db/fixtures/guest.png"),
encrypted_password:"guestuser"
)
end
=end
#if Rails.env == 'development'
  (1..20).each do |i|
      Post.create!(company_id:4, title: "タイトル#{i}", contents: "本文#{i}")
  end
