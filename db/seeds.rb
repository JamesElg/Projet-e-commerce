# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do 
item = Item.create(:name => Faker::Space.nasa_space_craft, :description => Faker::Lorem.paragraph, :price => rand(10..500) + 0.99)
puts item
end
