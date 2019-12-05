# # # # If the DB is populated, but you want to wipe it out to start with a fresh seeding, 
# # # # run the below command first:
# # # #       "rake db:migrate:reset"  
# # # # This will drop all, create the DB (with all tables), then remigrate all.\
# # * Database creation
# #   #$   rails db:create
# #   #$   rails db:migrate
# #   #$   rails db:seed


puts "Create USERS - Start"
User.create!(first_name: "Anonymous", last_name: "User", email: "mcnastud@hotmail.com", password: "12345")
User.create!(first_name: "Tom", last_name: "McNamee", email: "tom@tomjmcnamee.com", password: "12345")
puts "Create USERS - End"

puts "Create GAME - start"
ShutTheBoxGame.create!(user_id: 1, wins: 0, losses: 3, totalGames: 3)
ShutTheBoxGame.create!(user_id: 2, wins: 0, losses: 3, totalGames: 3)
puts "Create GAME - end"

puts "Create DICE ROLL - start"
ShutTheBoxDiceRoll.create!(user_id: 1, one: 20, two: 20, three: 20, four: 20, five: 20, six: 20)
ShutTheBoxDiceRoll.create!(user_id: 2, one: 20, two: 20, three: 20, four: 20, five: 20, six: 20)
puts "Create DICE ROLL - end"

puts "Create ROLL SUM - start"
ShutTheBoxRollSum.create!(user_id: 1, two: 10, three: 10, four: 10, five: 10, six: 10, seven: 10, eight: 10, nine: 10, ten: 10, eleven: 10, twelve: 10, totalRolls: 120)
ShutTheBoxRollSum.create!(user_id: 2, two: 10, three: 10, four: 10, five: 10, six: 10, seven: 10, eight: 10, nine: 10, ten: 10, eleven: 10, twelve: 10, totalRolls: 120)
puts "Create ROLL SUM - end"