# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


# puts "Create USERS - Start"
# User.create!(id: 1, first_name: "Anonymous", last_name: "User", email: "mcnastud@hotmail.com", password_digest: "12345")
# User.create!(id: 2, first_name: "Tom", last_name: "McNamee", email: "tom@tomjmcnamee.com", password_digest: "12345")
# puts "Create USERS - End"

# puts "Create GAME - start"
# ShutTheBoxGame.create!(id: 1, user_id: 1, win: false)
# ShutTheBoxGame.create!(id: 2, user_id: 1, win: false)
# ShutTheBoxGame.create!(id: 3, user_id: 1, win: false)
# ShutTheBoxGame.create!(id: 4, user_id: 2, win: false)
# ShutTheBoxGame.create!(id: 5, user_id: 2, win: false)
# ShutTheBoxGame.create!(id: 6, user_id: 2, win: false)
# puts "Create GAME - end"

puts "Create DICE ROLL - start"
ShutTheBoxDiceRoll.create!(id: 1, shut_the_box_game_id: 1, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 2, shut_the_box_game_id: 2, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 3, shut_the_box_game_id: 3, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 4, shut_the_box_game_id: 4, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 5, shut_the_box_game_id: 5, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 6, shut_the_box_game_id: 6, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
puts "Create DICE ROLL - end"

puts "Create ROLL SUM - start"
ShutTheBoxRollSum.create!(id: 1, shut_the_box_game_id: 1, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
ShutTheBoxRollSum.create!(id: 2, shut_the_box_game_id: 2, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
ShutTheBoxRollSum.create!(id: 3, shut_the_box_game_id: 3, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
ShutTheBoxRollSum.create!(id: 4, shut_the_box_game_id: 4, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
ShutTheBoxRollSum.create!(id: 5, shut_the_box_game_id: 5, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
ShutTheBoxRollSum.create!(id: 6, shut_the_box_game_id: 6, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1)
puts "Create ROLL SUM - end"