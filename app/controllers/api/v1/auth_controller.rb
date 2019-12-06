class Api::V1::AuthController < ApplicationController
    def create
        # byebug
        token = request.headers["Authorization"]
        userId = JWT.decode(token, ENV["JWTTokenKey"])[0]["userObj"]
        userObj = User.find(userId)
        userRollSums = ShutTheBoxRollSum.find_by(user_id: userId)
        userDiceRolls = ShutTheBoxDiceRoll.find_by(user_id: userId)
        # userRollSums = {two: rollSumRecord.sum(:two), three: rollSumRecord.sum(:three), four: rollSumRecord.sum(:four), five: rollSumRecord.sum(:five), six: rollSumRecord.sum(:six), seven: rollSumRecord.sum(:seven), eight: rollSumRecord.sum(:eight), nine: rollSumRecord.sum(:nine), ten: rollSumRecord.sum(:ten), eleven: rollSumRecord.sum(:eleven), twelve: rollSumRecord.sum(:twelve), totalRolls: rollSumRecord.sum(:totalRolls)}
        # userDiceRolls = {one: diceRollRecord.sum(:one), two: diceRollRecord.sum(:two), three: diceRollRecord.sum(:three), four: diceRollRecord.sum(:four), five: diceRollRecord.sum(:five), six: diceRollRecord.sum(:six)}
        allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve), totalRolls: ShutTheBoxRollSum.sum(:totalRolls)}
        allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}

        render json: {userObj: userObj,
        userRollSums: userRollSums, 
        userDiceRolls: userDiceRolls,
        allRollSums: allRollSums, 
        allDiceRolls: allDiceRolls}

    end

    def login
        userObj = User.find_by(email: params["auth"]["email"])
        if userObj && userObj.authenticate(params["auth"]["password"])
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            userRollSums = ShutTheBoxRollSum.find_by(user_id: userObj.id)
            userDiceRolls = ShutTheBoxDiceRoll.find_by(user_id: userObj.id)
            # userRollSums = {two: rollSumRecord.sum(:two), three: rollSumRecord.sum(:three), four: rollSumRecord.sum(:four), five: rollSumRecord.sum(:five), six: rollSumRecord.sum(:six), seven: rollSumRecord.sum(:seven), eight: rollSumRecord.sum(:eight), nine: rollSumRecord.sum(:nine), ten: rollSumRecord.sum(:ten), eleven: rollSumRecord.sum(:eleven), twelve: rollSumRecord.sum(:twelve), totalRolls: rollSumRecord.sum(:totalRolls)}
            # userDiceRolls = {one: diceRollRecord.sum(:one), two: diceRollRecord.sum(:two), three: diceRollRecord.sum(:three), four: diceRollRecord.sum(:four), five: diceRollRecord.sum(:five), six: diceRollRecord.sum(:six)}
            allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve), totalRolls: ShutTheBoxRollSum.sum(:totalRolls)}
            allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
    
            render json: {userObj: userObj, 
                    token: token,
                    userRollSums: userRollSums, 
                    userDiceRolls: userDiceRolls,
                    allRollSums: allRollSums, 
                    allDiceRolls: allDiceRolls}
        else
            render json: {status: "error", code: 300, message: "That Email and PW combination does not exist"}
        end
    end

    
    
end