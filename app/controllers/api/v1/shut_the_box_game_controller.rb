class Api::V1::ShutTheBoxGameController < ApplicationController


    def savegame
        usersGames = ShutTheBoxGame.find_by(user_id: params[:user_id])
        usersRolls = ShutTheBoxDiceRoll.find_by(user_id: params[:user_id])
        usersSums = ShutTheBoxRollSum.find_by(user_id: params[:user_id])

        usersGames.wins += shut_the_box_game_params["wins"]
        usersGames.losses += shut_the_box_game_params["losses"]
        usersGames.totalGames += 1
        usersRolls.one += shut_the_box_dice_roll_params["one"]
        usersRolls.two += shut_the_box_dice_roll_params["two"]
        usersRolls.three += shut_the_box_dice_roll_params["three"]
        usersRolls.four += shut_the_box_dice_roll_params["four"]
        usersRolls.five += shut_the_box_dice_roll_params["five"]
        usersRolls.six += shut_the_box_dice_roll_params["six"]
        usersSums.two += shut_the_box_roll_sum_params["two"]
        usersSums.three += shut_the_box_roll_sum_params["three"]
        usersSums.four += shut_the_box_roll_sum_params["four"]
        usersSums.five += shut_the_box_roll_sum_params["five"]
        usersSums.six += shut_the_box_roll_sum_params["six"]
        usersSums.seven += shut_the_box_roll_sum_params["seven"]
        usersSums.eight += shut_the_box_roll_sum_params["eight"]
        usersSums.nine += shut_the_box_roll_sum_params["nine"]
        usersSums.ten += shut_the_box_roll_sum_params["ten"]
        usersSums.eleven += shut_the_box_roll_sum_params["eleven"]
        usersSums.twelve += shut_the_box_roll_sum_params["twelve"]
        usersSums.totalRolls += shut_the_box_roll_sum_params["totalRolls"]
  
        if usersGames.save && usersRolls.save && usersSums.save
            render json: {status: "success"}
        else
            render json: {errors: userObj.errors.full_messages}
        end 
    end

private

    def shut_the_box_game_params
        params.require(:shut_the_box_game).permit(:wins, :losses, :totalGames)
    end

    def shut_the_box_dice_roll_params
        params.require(:shut_the_box_dice_roll).permit(:one,  :two,  :three,  :four,  :five,  :six)
    end

    def shut_the_box_roll_sum_params
        params.require(:shut_the_box_roll_sum).permit(:two,  :three,  :four,  :five,  :six,  :seven,  :eight,  :nine,  :ten,  :eleven,  :twelve, :totalRolls)
    end
    
end