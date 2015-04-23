User.create!(name:  "Example User")
10.times do |n|
  name  = Faker::Name.name
  User.create!(name: name)
end

users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.word
  picture = open("http://lorempixel.com/1170/600/people/")
  users.each { |user| user.microposts.create!(content: content, picture: picture) }
end

microposts = Micropost.order(:created_at).take(3)
microposts.each do |micropost|
  micropost.likes.create!(user_id: micropost.user.id)
end

microposts = Micropost.order(:created_at).take(10)
microposts.each do |micropost|
  content = Faker::Lorem.word
  micropost.comments.create!(user_id: micropost.user.id, content: content)
end
