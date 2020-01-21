class Api::V1::SimulatorController < ApplicationController
    def allRollsForGuest
        userRollSums = ShutTheBoxRollSum.find_by(user_id: 1)
        userDiceRolls = ShutTheBoxDiceRoll.find_by(user_id: 1)
        allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve), totalRolls: ShutTheBoxRollSum.sum(:totalRolls)}
        allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
        render json: { userRollSums: userRollSums, userDiceRolls: userDiceRolls, allRollSums: allRollSums, allDiceRolls: allDiceRolls }
    end

    def allRollsForEveryone
        allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
        allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
        render json: { allRollSums: allRollSums, allDiceRolls: allDiceRolls }
    end
    
end