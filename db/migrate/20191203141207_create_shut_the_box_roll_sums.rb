class CreateShutTheBoxRollSums < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_roll_sums do |t|
      t.references :shut_the_box_game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :two, default: 0
      t.integer :three, default: 0
      t.integer :four, default: 0
      t.integer :five, default: 0
      t.integer :six, default: 0
      t.integer :seven, default: 0
      t.integer :eight, default: 0
      t.integer :nine, default: 0
      t.integer :ten, default: 0
      t.integer :eleven, default: 0
      t.integer :twelve, default: 0

      t.timestamps
    end
  end
end
