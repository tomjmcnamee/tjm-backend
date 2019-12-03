Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get "/stb-rollhistory/:id", to: "shut_the_box_roll_history#allRollsForUser"
      get "/stb-rollhistory", to: "shut_the_box_roll_history#allRollsForEveryone"


      get "/campaigns/TopXCampaignsByCountOfUniqueContributors/:X", to: "campaign#getTopXCampaignsByCountOfUniqueContributors"
      get "/campaigns/TopXCampaignsByTotalContributions/:X", to: "campaign#getTopXCampaignsByTotalContributions"
      get "/campaigns/fetchcreatecampaignformdropdowns", to: "campaign#addcampaignformdropdowns"
      get "/campaigns/:id", to: "campaign#show"
      post "favorited_campaigns", to: "favorited_campaign#create"
      # get "/entities/namesandids", to: "entity#returnAllEntityNamesAndIDs"
      post "/campaigns", to: "campaign#create"
      post "/entities", to: "entity#create"
      # patch "/players/:name/win", to: "players#win"
      get '/autologin', to: "auth#create"
      post '/login', to:"auth#login"
      post '/user_accounts', to:"user_account#create"
      get '/myCampaignContributions/:id', to: "campaign_contribution#loggedInUserCampaignContributionObjsArr"
      get '/selectedCampaignContributions/:id', to: "campaign_contribution#selectedCampaignContributions"
      post '/contributeToCampaign', to: "campaign_contribution#create"
      post '/createPromotionDetails', to: "promotion_detail#create"
      post '/createPromotionSpecs', to: "promotion_spec#create"
      patch '/saveEditedFBPostDetails/:id', to: "promotion_spec#update"
      post '/createGeoDetailsEntries', to: "geographic_reach_detail#create"
    end
  end


end
