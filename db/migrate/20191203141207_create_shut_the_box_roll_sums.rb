class CreateShutTheBoxRollSums < ActiveRecord::Migration[6.0]
  def change
    create_table :shut_the_box_roll_sums do |t|
      t.references :shuttheboxgame, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :two
      t.integer :three
      t.integer :four
      t.integer :five
      t.integer :six
      t.integer :seven
      t.integer :eight
      t.integer :nine
      t.integer :ten
      t.integer :eleven
      t.integer :twelve

      t.timestamps
    end
  end
end
