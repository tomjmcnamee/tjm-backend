class Api::V1::ShutTheBoxRollHistoryController < ApplicationController
    def allRollsForUser
        rollSumArr = ShutTheBoxRollSum.where(user_id: params[:id])
        diceRollArr = ShutTheBoxDiceRoll.where(user_id: params[:id])
        userRollSums = {two: rollSumArr.sum(:two), three: rollSumArr.sum(:three), four: rollSumArr.sum(:four), five: rollSumArr.sum(:five), six: rollSumArr.sum(:six), seven: rollSumArr.sum(:seven), eight: rollSumArr.sum(:eight), nine: rollSumArr.sum(:nine), ten: rollSumArr.sum(:ten), eleven: rollSumArr.sum(:eleven), twelve: rollSumArr.sum(:twelve)}
        userDiceRolls = {one: diceRollArr.sum(:one), two: diceRollArr.sum(:two), three: diceRollArr.sum(:three), four: diceRollArr.sum(:four), five: diceRollArr.sum(:five), six: diceRollArr.sum(:six)}
        render json: { userRollSums: userRollSums, userDiceRolls: userDiceRolls }
    end

    def allRollsForEveryone
        allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
        allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
        render json: { allRollSums: allRollSums, allDiceRolls: allDiceRolls }
    end
    
end