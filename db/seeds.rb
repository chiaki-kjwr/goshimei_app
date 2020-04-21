ChatMessage.create!(
  [
    {
    id: 1, user_id: 1, chat_room_id:1, message:"hello"
    },
    {
    id: 2, user_id: 2, chat_room_id:2, message:"world"
    }
  ]
)

100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    )
end

#20.times do
  #Post.create(
    #title: Faker::Job.field,
    #contents: Faker::Twitter.status
    #user_id: Faker::Number.between(1,20),
   
#end

#users = User.order(:created_at).take(3)
#20.times do
  #contents = Faker::Lorem.sentence(5)
  #title= Faker::Job.field
  #users.each { |user| user.posts.create!(contents: content) }
#end

if Rails.env == 'development'
  (1..20).each do |i|
      Post.create(name: "ユーザ#{i}", title: "タイトル#{i}", contents: "本文#{i}")
  end
end

