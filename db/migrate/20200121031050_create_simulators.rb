class CreateSimulators < ActiveRecord::Migration[6.0]
  def change
    create_table :simulators do |t|
      t.string :inner_or_outer
      t.string :single_tile_above_number
      t.integer :games
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
