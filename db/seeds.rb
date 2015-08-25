# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


matty = User.create!(is_admin: true, username: 'mattbaker', has_pro_permissions: false, password_digest: "1234")




3.times do
  User.create!(is_admin: false, name: Faker::Name.first_name + " " + Faker::Name.last_name, username: Faker::Internet.user_name, has_pro_permissions: true, password: "1234")
  User.create!(is_admin: false, name: Faker::Name.first_name + " " + Faker::Name.last_name, username: Faker::Internet.user_name, has_pro_permissions: false, password: "1234")
  Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: Faker::Avatar.image, director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
  Review.create!(stars: (rand(5)+1), title: Faker::Book.title, body: Faker::Hacker.say_something_smart, thumb_is_up: true, reviewer_id: (rand(5)+1), movie_id: (rand(5)+1))
  Comment.create!(body: Faker::Hacker.say_something_smart, commenter_id: (rand(5)+1), commentable_id: (rand(5)+1), commentable_type: ["movie","review"].sample)
end

3.times do
  Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: Faker::Avatar.image, director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
end

10.times do
  Actor.create!(name: Faker::Name.first_name + " " + Faker::Name.last_name)
end

10.times do
  Role.create!(actor_id: (rand(10) + 1), movie_id: (rand(6) + 1))
end


