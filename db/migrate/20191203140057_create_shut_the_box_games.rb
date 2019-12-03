class CreateShutTheBoxGames < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_games do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :win, default: false

      t.timestamps
    end
  end
end
