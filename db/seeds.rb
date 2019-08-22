# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.delete_all
Item.delete_all
User.delete_all
Category.delete_all


User.create!(username: "admin", email: "admin@email.com", password: "admin123", admin: true)

User.create!(username: Faker::Name.last_name, email: "email@email.com", address: Faker::Address.full_address, password: "password123")

5.times do
  User.create!(username: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address, password: Faker::Internet.password)
end

p "Users created"

8.times do
  Category.create!(name: Faker::Game.genre)
end

p "Catagories created"

26.times do
  Item.create!(title: Faker::Game.title, description: Faker::Lorem.paragraph, user: User.find(User.pluck(:id).sample), category: Category.find(Category.pluck(:id).sample))
end

p "Items created"

12.times do
  Reservation.create!(item: Item.find(Item.pluck(:id).sample), user: User.find(User.pluck(:id).sample))
end

p "Reservations created"
p "Database seeded"
