class Api::V1::UserController < ApplicationController
    def create
        userObj = User.new(user_params)
        if userObj.save
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            userRollSums = {two: 0, three: 0, four: 0, five: 0, six: 0, seven: 0, eight: 0, nine: 0, ten: 0, eleven: 0, twelve: 0}
            userDiceRolls = {one: 0, two: 0, three: 0, four: 0, five: 0, six: 0}
            
            render json: {userObj: userObj, 
                        token: token, 
                        userRollSums: userRollSums, 
                        userDiceRolls: userDiceRolls}
        else
            render json: {errors: userObj.errors.full_messages}
        end
    end

    def login
        userObj = UserAccount.find_by(email_address: params["auth"]["email_address"])
        if userObj && userObj.authenticate(params["auth"]["password"])
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            rollSumArr = ShutTheBoxRollSum.where(user_id: userObj.id)
            diceRollArr = ShutTheBoxDiceRoll.where(user_id: userObj.id)
            userRollSums = {two: rollSumArr.sum(:two), three: rollSumArr.sum(:three), four: rollSumArr.sum(:four), five: rollSumArr.sum(:five), six: rollSumArr.sum(:six), seven: rollSumArr.sum(:seven), eight: rollSumArr.sum(:eight), nine: rollSumArr.sum(:nine), ten: rollSumArr.sum(:ten), eleven: rollSumArr.sum(:eleven), twelve: rollSumArr.sum(:twelve)}
            userDiceRolls = {one: diceRollArr.sum(:one), two: diceRollArr.sum(:two), three: diceRollArr.sum(:three), four: diceRollArr.sum(:four), five: diceRollArr.sum(:five), six: diceRollArr.sum(:six)}
            render json: {userObj: userObj, 
                    token: token, 
                    userRollSums: userRollSums, 
                    userDiceRolls: userDiceRolls}
        else
            render json: {errors: userObj.errors.full_messages}
        end 
    end

private

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
end
    
end