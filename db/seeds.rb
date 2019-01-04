# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Purchase.create(name: "Doritos", price: 1.0, quantity: 10)
Purchase.create(name: "Paper Towels 6 Rolls", price: 10.0, quantity: 10)
Purchase.create(name: "Tide Liquid Detergent", price: 15.0, quantity: 10)
Purchase.create(name: "Snickers Minis", price: 4.0, quantity: 10)
Purchase.create(name: "Tortilla Chips", price: 4.0, quantity: 10)
Purchase.create(name: "Oatly Oat Milk", price: 5.0, quantity: 10)
Purchase.create(name: "Glad Zipper Food Storage bags", price: 3.0, quantity: 10)

User.create(name: "Oscar McCamey", password: "dog", money: 100)
User.create(name: "Olive DeAngelis", password: "dog", money: 100, amdin: true)
