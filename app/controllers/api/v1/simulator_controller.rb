class Api::V1::SimulatorController < ApplicationController
    def runStbSimulator
        simulatorResults = Simulator.runSimulator(params[:numberOfGames].to_i, params[:higherThanThisNumber].to_i, params[:innerOrOuter])
        historyRecordToUpdate = Simulator.find_by(inner_or_outer: params[:innerOrOuter], single_tile_above_number: params[:higherThanThisNumber])
        newWinCount = Simulator.find(historyRecordToUpdate.id).wins + simulatorResults[:gameResults][:wins]
        newLossCount = Simulator.find(historyRecordToUpdate.id).losses + simulatorResults[:gameResults][:losses]
        newGameCount = Simulator.find(historyRecordToUpdate.id).games + params[:numberOfGames].to_i
        Simulator.find(historyRecordToUpdate.id).update(games: newGameCount, losses: newLossCount, wins: newWinCount)

        allHistoryData = Simulator.all.sort_by { |obj| obj.id }
        # filterdHistory = SimulatorSerializer.new(allHistoryData).as_json
        # byebug
        # userRollSums = ShutTheBoxRollSum.find_by(user_id: 1)
        # userDiceRolls = ShutTheBoxDiceRoll.find_by(user_id: 1)
        # allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve), totalRolls: ShutTheBoxRollSum.sum(:totalRolls)}
        # allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
        render json: { gameResults: simulatorResults[:gameResults], allHistoryData: allHistoryData }
    end

    def getSimulatorHistory
        allHistoryData = Simulator.all.sort_by { |obj| obj.id }
        # filterdHistory = SimulatorSerializer.new(allHistoryData).as_json
        # byebug
        # userRollSums = ShutTheBoxRollSum.find_by(user_id: 1)
        # userDiceRolls = ShutTheBoxDiceRoll.find_by(user_id: 1)
        # allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve), totalRolls: ShutTheBoxRollSum.sum(:totalRolls)}
        # allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
        render json: { allHistoryData: allHistoryData }
    end

    # def allRollsForEveryone
    #     allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
    #     allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
    #     render json: { allRollSums: allRollSums, allDiceRolls: allDiceRolls }
    # end
    
end