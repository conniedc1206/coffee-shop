puts "🌱 Seeding data..."

# clears out previous data in db tables
Customer.destroy_all
Coffee.destroy_all
Order.destroy_all

# run a loop 10 times
10.times do
  Customer.create(name: Faker::Name.name )
end

# run a loop 10 times
10.times do
  Coffee.create(title: Faker::Coffee.blend_name)
end

# run a loop 50 times
50.times do
  Order.create(price: rand(1..5), customer: Customer.all.sample, coffee: Coffee.all.sample)
end

puts "🌱 Done seeding!"