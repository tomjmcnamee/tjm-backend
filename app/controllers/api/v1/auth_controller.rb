class Api::V1::AuthController < ApplicationController
    def create
        # byebug
        token = request.headers["Authorization"]
        userId = JWT.decode(token, ENV["JWTTokenKey"])[0]["userObj"]
        userObj = User.find(userId)
        rollSumArr = ShutTheBoxRollSum.where(user_id: userId)
        diceRollArr = ShutTheBoxDiceRoll.where(user_id: userId)
        userRollSums = {two: rollSumArr.sum(:two), three: rollSumArr.sum(:three), four: rollSumArr.sum(:four), five: rollSumArr.sum(:five), six: rollSumArr.sum(:six), seven: rollSumArr.sum(:seven), eight: rollSumArr.sum(:eight), nine: rollSumArr.sum(:nine), ten: rollSumArr.sum(:ten), eleven: rollSumArr.sum(:eleven), twelve: rollSumArr.sum(:twelve)}
        userDiceRolls = {one: diceRollArr.sum(:one), two: diceRollArr.sum(:two), three: diceRollArr.sum(:three), four: diceRollArr.sum(:four), five: diceRollArr.sum(:five), six: diceRollArr.sum(:six)}
        allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
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
            rollSumArr = ShutTheBoxRollSum.where(user_id: userObj.id)
            diceRollArr = ShutTheBoxDiceRoll.where(user_id: userObj.id)
            userRollSums = {two: rollSumArr.sum(:two), three: rollSumArr.sum(:three), four: rollSumArr.sum(:four), five: rollSumArr.sum(:five), six: rollSumArr.sum(:six), seven: rollSumArr.sum(:seven), eight: rollSumArr.sum(:eight), nine: rollSumArr.sum(:nine), ten: rollSumArr.sum(:ten), eleven: rollSumArr.sum(:eleven), twelve: rollSumArr.sum(:twelve)}
            userDiceRolls = {one: diceRollArr.sum(:one), two: diceRollArr.sum(:two), three: diceRollArr.sum(:three), four: diceRollArr.sum(:four), five: diceRollArr.sum(:five), six: diceRollArr.sum(:six)}
            allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
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