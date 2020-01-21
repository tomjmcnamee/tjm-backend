Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get "/stb-guestrollhistory", to: "shut_the_box_roll_history#allRollsForGuest"
      # get "/stb-rollhistory", to: "shut_the_box_roll_history#allRollsForEveryone"
      get '/autologin', to: "auth#create"
      get '/stb-RunStbSimulator', to: "simulator#getSimulatorHistory"
      post '/stb-RunStbSimulator', to: "simulator#runStbSimulator"
      post '/login', to:"auth#login"
      post '/user', to:"user#create"
      post '/stb-commitgame', to:"shut_the_box_game#savegame"

    end
  end


end
