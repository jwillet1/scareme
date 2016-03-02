# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Ghost")
Category.create(name: "Witch")
Category.create(name: "Monster")
Category.create(name: "Stalker")
Category.create(name: "Night")
Category.create(name: "Children")

User.create!(name: "Bob Green",
            email: "bob@example.com",
            password: "password")

40.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password)
end

30.times do |n|
  body = Faker::Hipster.paragraph
  user_id = n + 1
  Story.create(body: body,
               user_id: user_id,
               category_id: rand(1..6))
end