class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
        t.references :game
        t.string :name, null: false

        t.timestamps null: false
    end
  end
end