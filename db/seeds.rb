# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

matty = User.create!(is_admin: true, username: 'mattymcbakersworth', is_reviewer: false)

5.times do
  User.create!(is_admin: false, username: Faker::Internet.user_name, is_reviewer: true)
  User.create!(is_admin: false, username: Faker::Internet.user_name, is_reviewer: false)
  Movie.create!(title: Faker::Book.title, admin: matty, tagline: Faker::Hacker.say_something_smart, image_url: Faker::Avatar.image, director: Faker::Name.first_name + Faker::Name.last_name, producer: Faker::Name.first_name + Faker::Name.last_name, description: Faker::Hacker.say_something_smart)
  Review.create!(stars: (rand(5)+1), title: Faker::Book.title, body: Faker::Hacker.say_something_smart, thumb_is_up: true, reviewer_id: (rand(5)+1), movie_id: (rand(5)+1))
  Comment.create!(body: Faker::Hacker.say_something_smart, commenter_id: (rand(5)+1), commentable_id: (rand(5)+1), commentable_type: ["movie","review"].sample)
end


####  problematic ones  ####
# m.reviews.reviewer  # fixed
# m.reviews[0].comments # fixed
