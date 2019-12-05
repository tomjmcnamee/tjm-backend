class CreateShutTheBoxDiceRolls < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_dice_rolls do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :one, default: 0
      t.integer :two, default: 0
      t.integer :three, default: 0
      t.integer :four, default: 0
      t.integer :five, default: 0
      t.integer :six, default: 0

      t.timestamps
    end
  end
end
