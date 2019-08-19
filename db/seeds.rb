# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


6.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address, password: Faker::Internet.password)
end

p "Users created"

8.times do
  Category.create!(name: Faker::Game.genre)
end

p "Catagories created"


26.times do
  Item.create!(title: Faker::Game.title, description: Faker::Quote.matz, user: User.find((1..6).to_a.sample), category: Category.find((1..8).to_a.sample))
end

p "Items created"

12.times do
  Reservation.create!(item: Item.find((1..25).to_a.sample), user: User.find((1..6).to_a.sample))
end

p "Reservations created"
p "Database seeded"
