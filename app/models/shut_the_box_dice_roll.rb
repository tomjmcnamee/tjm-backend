class ShutTheBoxDiceRoll < ApplicationRecord
  belongs_to :shuttheboxgame
  belongs_to :user
end
