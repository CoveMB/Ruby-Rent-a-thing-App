
if Rails.env.production?
  Category.delete_all

  Category.create!(name: "Housing")
  Category.create!(name: "Cars")
  Category.create!(name: "Furnitures")
  Category.create!(name: "Pets")
  Category.create!(name: "Heavy Machinery")
  Category.create!(name: "Cuttlers")

  User.create!(username: "Jean", password: "password1", address: "35 rue des trois freres Paris", email:"jean@gmail.com")
  User.create!(username: "Beau", password: "password1", address: "1176 rue saint Catherine Ouest Montreal", email:"beau@gmail.com")
  User.create!(username: "Benjamin", password: "password1", address: "5417 rue saint dominique montreal", email: "benjamin@gmail.com")
  User.create!(username: "Lisa", password: "password1", address: "355 3e avenue Quebec City", email: "lisa@gmail.com")
end



if Rails.env.development?
  Reservation.delete_all
  Item.delete_all
  User.delete_all
  Category.delete_all

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
end
