class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :card, index: true
      t.references :game, index: true 
      t.string :guess, null: false

      t.timestamps null: false
    end
  end
end
