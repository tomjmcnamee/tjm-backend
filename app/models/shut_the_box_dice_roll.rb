class ShutTheBoxDiceRoll < ApplicationRecord
  belongs_to :shut_the_box_game
  belongs_to :user
end
