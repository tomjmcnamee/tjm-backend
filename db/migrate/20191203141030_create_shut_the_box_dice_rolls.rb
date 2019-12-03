class CreateShutTheBoxDiceRolls < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_dice_rolls do |t|
      t.references :shuttheboxgame, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :one
      t.integer :two
      t.integer :three
      t.integer :four
      t.integer :five
      t.integer :six

      t.timestamps
    end
  end
end
