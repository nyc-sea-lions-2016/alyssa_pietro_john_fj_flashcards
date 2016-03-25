class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :card
      t.references :game
      t.string :guess, null: false 

      t.timestamps null: false
    end
  end
end
