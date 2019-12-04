class User < ApplicationRecord
  has_many :shut_the_box_roll_sums
  has_many :shut_the_box_dice_rolls
  has_many :shut_the_box_games

  has_secure_password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
end
