# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Create USERS - Start"
User.create(id: 1, first_name: "Anonymous", last_name: "User", email: "mcnastud@hotmail.com", password_digest: "12345")
User.create(id: 2, first_name: "Tom", last_name: "McNamee", email: "tom@tomjmcnamee.com", password_digest: "12345")
puts "Create USERS - End"