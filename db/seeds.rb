# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

matty = User.create!(is_admin: true, username: 'mattbaker', has_pro_permissions: false, hashed_password: "1234")

5.times do
  User.create!(is_admin: false, username: Faker::Internet.user_name, has_pro_permissions: true, hashed_password: "1234")
  User.create!(is_admin: false, username: Faker::Internet.user_name, has_pro_permissions: false, hashed_password: "1234")
  Review.create!(stars: (rand(5)+1), title: Faker::Book.title, body: Faker::Hacker.say_something_smart, thumb_is_up: true, reviewer_id: (rand(5)+1), movie_id: (rand(5)+1))
  Comment.create!(body: Faker::Hacker.say_something_smart, commenter_id: (rand(5)+1), commentable_id: (rand(5)+1), commentable_type: ["movie","review"].sample)
end


Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: 'http://lorempixel.com/750/450/nightlife/2', director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: 'http://lorempixel.com/750/450/nightlife/1', director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: 'http://lorempixel.com/750/450/nightlife/3', director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: 'http://lorempixel.com/750/450/nightlife/4', director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: 'http://lorempixel.com/750/450/nightlife/5', director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)



####  problematic ones  ####
# m.reviews.reviewer  # fixed
# m.reviews[0].comments # fixed
