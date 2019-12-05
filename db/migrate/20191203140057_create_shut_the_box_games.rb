class CreateShutTheBoxGames < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_games do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :totalGames, default: 0
      t.timestamps
    end
  end
end
