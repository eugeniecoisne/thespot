puts "WELCOME TO THE SEED =D"

puts "I KILL THE ACTUAL DB AHAHAHAHA"

User.destroy_all
Place.destroy_all
Booking.destroy_all

puts "OKAY NO DATA - GO TO CREATE NEEEEEEEW DATAAAAAAAS"

puts "Create 2 users"
User.create!(
  email: "booba@booba.com",
  password: "123456",
  last_name: "Booba",
  first_name: "Booba",
  birth_date: "1985-07-08"
)

User.create!(
  email: "president@avant.com",
  password: "123456",
  last_name: "Sarkozy",
  first_name: "Nicolas",
  birth_date: "1953-12-08"
)

puts "Create users done !"

puts "Create 5 places - YOUHOUHOU"
place = Place.new(
  title: "Garden in London",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint suscipit blanditiis molestias cupiditate commodi, a beatae sunt laborum ut. Tenetur fugit, vitae ab cum. Facere porro amet rerum molestiae dolor.",
  category: "Garden",
  address: "London",
  capacity: 150,
  price: 500
)
place.user = User.first
place.save

place = Place.new(
  title: "Garden in Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint suscipit blanditiis molestias cupiditate commodi, a beatae sunt laborum ut. Tenetur fugit, vitae ab cum. Facere porro amet rerum molestiae dolor.",
  category: "Garden",
  address: "Paris",
  capacity: 200,
  price: 1500
)
place.user = User.last
place.save

place = Place.new(
  title: "Swimming pool in Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint suscipit blanditiis molestias cupiditate commodi, a beatae sunt laborum ut. Tenetur fugit, vitae ab cum. Facere porro amet rerum molestiae dolor.",
  category: "Swimming pool",
  address: "Paris",
  capacity: 50,
  price: 650
)
place.user = User.first
place.save

place = Place.new(
  title: "Garage in London",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint suscipit blanditiis molestias cupiditate commodi, a beatae sunt laborum ut. Tenetur fugit, vitae ab cum. Facere porro amet rerum molestiae dolor.",
  category: "Garage",
  address: "London",
  capacity: 100,
  price: 750
)
place.user = User.first
place.save

place = Place.new(
  title: "Loft in London",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint suscipit blanditiis molestias cupiditate commodi, a beatae sunt laborum ut. Tenetur fugit, vitae ab cum. Facere porro amet rerum molestiae dolor.",
  category: "Loft",
  address: "London",
  capacity: 75,
  price: 1200
)
place.user = User.last
place.save

puts "SEED IS DONE BYE BYE BISOUS BISOUS"
