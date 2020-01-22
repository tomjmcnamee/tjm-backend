class Simulator < ApplicationRecord



  def self.runSimulator(countOfGames, higherThanThisNumber, innerOrOuter)
    # @countOfDieRolls = 0
    # dieResults = {1=> 0, 2=> 0, 3=> 0, 4=> 0, 5=> 0, 6=> 0}
    # rollResults = {2=> 0, 3=> 0, 4=> 0, 5=> 0, 6=> 0, 7=> 0, 8=> 0, 9=> 0, 10=> 0, 11=> 0, 12=> 0}
    gameResults = {:wins=> 0, :losses=> 0}


    def self.twoSum(boardArr, rollSum) 
      result = []
      # for (let i = 0; i < boardArr.length; i++) {
      i = 0
      second = 0
      until  i == (boardArr.length/2.to_f + 1).to_i
        j = second += 1
        until j == boardArr.length
          if (boardArr[i] + boardArr[j] === rollSum) 
              result.push([i, j]);
          end
          j +=  1
        end
        i += 1
      end
      result
    end

    def self.roll()
    # def roll()
      dice = [1,2,3,4,5,6]
      die1 = dice.sample
      die2 = dice.sample
      # dieResults[die1] += 1
      # dieResults[die2] += 1
      result = die1 + die2
      # rollResults[result] += 1
      # @countOfDieRolls += 1
      return result
    end


    def self.newGame(gameResults, higherThanThisNumber, innerOrOuter)

      # puts "new game--------------"
      board = [1,2,3,4,5,6,7,8,9,10,11,12]
      gameover = 0


      while gameover < 1 do
        # puts board
        if board.length > 0 
          result = roll()
          # puts "result of roll = #{result}"
          if result > higherThanThisNumber
            # puts "result is bigger than X"
            remainingLength = board.length
            if board.find_index(result)  ## this checks to see if the X or higher block is availble
              # puts "The results block IS available"
              board.delete_at(board.find_index(result)) 
            else  ## else, the result is NOT on the board and result needs to be split into 2 other blocks
              # puts "The results block IS NOT available, so it must be split"
              if  board.length == 1  # IF the Board has only 1 tile but it doenst match the roll
                gameResults[:losses] += 1
                gameover += 1
              else  # IF the Board has only 1 tile but it doenst match the roll
                

            pairsArr = twoSum(board, result)
            # puts "pairs Arr = #{pairsArr} "
            if pairsArr.length == 0
              if board.find_index(result)  ## this checks to see if the X or higher block is availble
                # puts "The results block IS available"
                board.delete_at(board.find_index(result)) 
              else
                gameResults[:losses] += 1
                gameover += 1
              end
            else
              if innerOrOuter == 1
                board.delete_at(pairsArr[0][1]) 
                board.delete_at(pairsArr[0][0]) 
              else
                lastindex = pairsArr.length - 1
                board.delete_at(pairsArr[lastindex][1]) 
                board.delete_at(pairsArr[lastindex][0]) 
              end
            end


              end   # IF the Board has only 1 tile but it doenst match the roll

            end  ## end for result being on the board
          else  ## else for IF statement about result bigger than X
            # puts "result is NOT bigger than X"


        
            
            pairsArr = twoSum(board, result)
            # puts "pairs Arr = #{pairsArr} "

            # ifPairsDeleteVariablyOrDeleteWholeNumber(pairsArr, board)

            if pairsArr.length == 0
              if board.find_index(result)  ## this checks to see if the X or higher block is availble
                # puts "The results block IS available"
                board.delete_at(board.find_index(result)) 
              else
                gameResults[:losses] += 1
                gameover += 1
              end
            else
              if innerOrOuter == 1
                board.delete_at(pairsArr[0][1]) 
                board.delete_at(pairsArr[0][0]) 
              else
                lastindex = pairsArr.length - 1
                board.delete_at(pairsArr[lastindex][1]) 
                board.delete_at(pairsArr[lastindex][0]) 
              end
            end




          end  ## end for IF about result bigger than X

        else  ## Else for IF statement about board length > 0
          gameResults[:wins] += 1
          gameover += 1
        end ## END for IF statement about board length > 0

      end # ends while loop re: gameover < 1

    end

    
    # puts "How many times do you want to go through?"       
    # countOfGames = gets.chomp.to_i
    # puts "\n"

    # puts "Above WHICH number should the single role result tile be flipped, when available (7 is statistically correct answer)"
    # higherThanThisNumber = gets.chomp.to_i
    # puts "\n"
    
    # puts "any roll result #{higherThanThisNumber} and below will take a pair of tiles if available.  Should that be"
    # puts "1 - the Bookend pair?"
    # puts "or 2 - The Inner pair"
    # puts "example: roll sum = 5, bookend pair = [1,4], inner pair = [2,3]"
    # innerOrOuter = gets.chomp.to_i
    # puts "\n"


    countOfGames.times do 
      newGame(gameResults, higherThanThisNumber, innerOrOuter)
      # newGame()
    end

    # puts dieResults
    # puts rollResults
    puts gameResults

    return {gameResults: gameResults}

    
    # puts "Individual Dice Rolls"
    # puts "1: #{dieResults[1]/(@countOfDieRolls*2).to_f}%"
    # puts "2: #{dieResults[2]/(@countOfDieRolls*2).to_f}%"
    # puts "3: #{dieResults[3]/(@countOfDieRolls*2).to_f}%"
    # puts "4: #{dieResults[4]/(@countOfDieRolls*2).to_f}%"
    # puts "5: #{dieResults[5]/(@countOfDieRolls*2).to_f}%"
    # puts "6: #{dieResults[6]/(@countOfDieRolls*2).to_f}%"
    
    # puts "Combined Dice Rolls"
    # puts "2: #{rollResults[2]/@countOfDieRolls.to_f}%"
    # puts "3: #{rollResults[3]/@countOfDieRolls.to_f}%"
    # puts "4: #{rollResults[4]/@countOfDieRolls.to_f}%"
    # puts "5: #{rollResults[5]/@countOfDieRolls.to_f}%"
    # puts "6: #{rollResults[6]/@countOfDieRolls.to_f}%"
    # puts "7: #{rollResults[7]/@countOfDieRolls.to_f}%"
    # puts "8: #{rollResults[8]/@countOfDieRolls.to_f}%"
    # puts "9: #{rollResults[9]/@countOfDieRolls.to_f}%"
    # puts "10: #{rollResults[10]/@countOfDieRolls.to_f}%"
    # puts "11: #{rollResults[11]/@countOfDieRolls.to_f}%"
    # puts "12: #{rollResults[12]/@countOfDieRolls.to_f}%"
    # puts "Wins Percentage = #{(gameResults[:wins].to_f/countOfGames) * 100}%"

  end #ends runSimulator

  def self.hi 
    puts "poop"
  end


end
