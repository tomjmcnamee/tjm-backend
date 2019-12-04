class Api::V1::UserController < ApplicationController
    def create
        userObj = User.new(user_params)
        if userObj.save
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            userRollSums = {two: 0, three: 0, four: 0, five: 0, six: 0, seven: 0, eight: 0, nine: 0, ten: 0, eleven: 0, twelve: 0}
            userDiceRolls = {one: 0, two: 0, three: 0, four: 0, five: 0, six: 0}
            allRollSums = {two: ShutTheBoxRollSum.sum(:two), three: ShutTheBoxRollSum.sum(:three), four: ShutTheBoxRollSum.sum(:four), five: ShutTheBoxRollSum.sum(:five), six: ShutTheBoxRollSum.sum(:six), seven: ShutTheBoxRollSum.sum(:seven), eight: ShutTheBoxRollSum.sum(:eight), nine: ShutTheBoxRollSum.sum(:nine), ten: ShutTheBoxRollSum.sum(:ten), eleven: ShutTheBoxRollSum.sum(:eleven), twelve: ShutTheBoxRollSum.sum(:twelve)}
            allDiceRolls = {one: ShutTheBoxDiceRoll.sum(:one), two: ShutTheBoxDiceRoll.sum(:two), three: ShutTheBoxDiceRoll.sum(:three), four: ShutTheBoxDiceRoll.sum(:four), five: ShutTheBoxDiceRoll.sum(:five), six: ShutTheBoxDiceRoll.sum(:six)}
            render json: {userObj: userObj, 
                        token: token, 
                        userRollSums: userRollSums, 
                        userDiceRolls: userDiceRolls,
                        allRollSums: allRollSums, 
                        allDiceRolls: allDiceRolls}
        else
            render json: {errors: userObj.errors.full_messages}
        end
    end

private

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
end
    
end