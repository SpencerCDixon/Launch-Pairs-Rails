# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

20.times do |n|
  User.create(email: "user#{n}@email.com", password: '12345678', 
              password_confirmation: '12345678',
              first_name: Faker::Name.name, last_name: Faker::Name.name)
end

