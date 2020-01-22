# # # # If the DB is populated, but you want to wipe it out to start with a fresh seeding, 
# # # # run the below command first:
# # # #       "rake db:migrate:reset"  
# # # # This will drop all, create the DB (with all tables), then remigrate all.\
# # * Database creation
# #   #$   rails db:create
# #   #$   rails db:migrate
# #   #$   rails db:seed


# puts "Create USERS - Start"
# User.create!(first_name: "Anonymous", last_name: "User", email: "mcnastud@hotmail.com", password: "12345")
# User.create!(first_name: "Tom", last_name: "McNamee", email: "tom@tomjmcnamee.com", password: "12345")
# puts "Create USERS - End"

# puts "Create GAME - start"
# ShutTheBoxGame.create!(user_id: 1, wins: 0, losses: 0, totalGames: 0)
# ShutTheBoxGame.create!(user_id: 2, wins: 0, losses: 0, totalGames: 0)
# puts "Create GAME - end"

# puts "Create DICE ROLL - start"
# ShutTheBoxDiceRoll.create!(user_id: 1, one: 0, two: 0, three: 0, four: 0, five: 0, six: 0)
# ShutTheBoxDiceRoll.create!(user_id: 2, one: 0, two: 0, three: 0, four: 0, five: 0, six: 0)
# puts "Create DICE ROLL - end"

# puts "Create ROLL SUM - start"
# ShutTheBoxRollSum.create!(user_id: 1, two: 0, three: 0, four: 0, five: 0, six: 0, seven: 0, eight: 0, nine: 0, ten: 0, eleven: 0, twelve: 0, totalRolls: 0)
# ShutTheBoxRollSum.create!(user_id: 2, two: 0, three: 0, four: 0, five: 0, six: 0, seven: 0, eight: 0, nine: 0, ten: 0, eleven: 0, twelve: 0, totalRolls: 0)
# puts "Create ROLL SUM - end"

puts "Create blank STB-Simulator history - START"
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "1", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "2", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "3", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "4", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "5", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "6", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "7", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "8", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "9", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "10", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "11", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "inner", single_tile_above_number: "12", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "1", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "2", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "3", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "4", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "5", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "6", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "7", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "8", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "9", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "10", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "11", games: 0, wins: 0, losses: 0)
Simulator.create!(inner_or_outer: "outer", single_tile_above_number: "12", games: 0, wins: 0, losses: 0)
puts "Create blank STB-Simulator history - END"