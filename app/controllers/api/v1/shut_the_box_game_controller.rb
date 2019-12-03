class Api::V1::ShutTheBoxGameController < ApplicationController
    def recordGame
        newGame = ShutTheBoxGame.new(shut_the_box_game_params)
        if newGame.save
            ShutTheBoxDiceRoll.create(shut_the_box_game_id: newGame.id, shut_the_box_dice_roll_params)
            ShutTheBoxRollSum.create(shut_the_box_game_id: newGame.id, shut_the_box_roll_sum_params)
            render json: {userObj: userObj, 
                    token: token, 
                    userRollSums: userRollSums, 
                    userDiceRolls: userDiceRolls}
        else
            render json: {errors: userObj.errors.full_messages}
        end 
    end

private

    def shut_the_box_game_params
        params.require(:shut_the_box_game).permit(:user_id, :win)
    end

    def shut_the_box_dice_roll_params
        params.require(:shut_the_box_dice_roll).permit(:shut_the_box_game_id, :user_id, :two,  :three,  :four,  :five,  :six,  :seven,  :eight,  :nine,  :ten,  :eleven,  :twelve)
    end

    def shut_the_box_roll_sum_params
        params.require(:shut_the_box_roll_sum).permit(:shut_the_box_game_id, :user_id, :one, :two,  :three,  :four,  :five,  :six)
    end
    
end