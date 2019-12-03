class ShutTheBoxGame < ApplicationRecord
  has_many :shut_the_box_roll_sums
  has_many :shut_the_box_dice_rolls
  belongs_to :user
end
