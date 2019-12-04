# # # # If the DB is populated, but you want to wipe it out to start with a fresh seeding, 
# # # # run the below command first:
# # # #       "rake db:migrate:reset"  
# # # # This will drop all, create the DB (with all tables), then remigrate all.\
# # * Database creation
# #   #$   rails db:create
# #   #$   rails db:migrate
# #   #$   rails db:seed


puts "Create USERS - Start"
User.create!(id: 1, first_name: "Anonymous", last_name: "User", email: "mcnastud@hotmail.com", password: "12345")
User.create!(id: 2, first_name: "Tom", last_name: "McNamee", email: "tom@tomjmcnamee.com", password: "12345")
puts "Create USERS - End"

puts "Create GAME - start"
ShutTheBoxGame.create!(id: 1, user_id: 1, win: false)
ShutTheBoxGame.create!(id: 2, user_id: 1, win: false)
ShutTheBoxGame.create!(id: 3, user_id: 1, win: false)
ShutTheBoxGame.create!(id: 4, user_id: 2, win: false)
ShutTheBoxGame.create!(id: 5, user_id: 2, win: false)
ShutTheBoxGame.create!(id: 6, user_id: 2, win: false)
puts "Create GAME - end"

puts "Create DICE ROLL - start"
ShutTheBoxDiceRoll.create!(id: 1, shut_the_box_game_id: 1, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 2, shut_the_box_game_id: 2, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 3, shut_the_box_game_id: 3, user_id: 1, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 4, shut_the_box_game_id: 4, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 5, shut_the_box_game_id: 5, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
ShutTheBoxDiceRoll.create!(id: 6, shut_the_box_game_id: 6, user_id: 2, one: 3, two: 5, three: 4, four: 6, five: 5, six: 7)
puts "Create DICE ROLL - end"

puts "Create ROLL SUM - start"
ShutTheBoxRollSum.create!(id: 1, shut_the_box_game_id: 1, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
ShutTheBoxRollSum.create!(id: 2, shut_the_box_game_id: 2, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
ShutTheBoxRollSum.create!(id: 3, shut_the_box_game_id: 3, user_id: 1, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
ShutTheBoxRollSum.create!(id: 4, shut_the_box_game_id: 4, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
ShutTheBoxRollSum.create!(id: 5, shut_the_box_game_id: 5, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
ShutTheBoxRollSum.create!(id: 6, shut_the_box_game_id: 6, user_id: 2, two: 5, three: 4, four: 6, five: 5, six: 7, seven: 3, eight: 3, nine: 3, ten: 3, eleven: 2, twelve: 1, totalRolls: 42)
puts "Create ROLL SUM - end"