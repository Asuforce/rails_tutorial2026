# Create a main sample user
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar1234",
             password_confirmation: "foobar1234",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# Create additional users in bulk
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password1234"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Create microposts for a subset of users
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Create relationships of user following
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
