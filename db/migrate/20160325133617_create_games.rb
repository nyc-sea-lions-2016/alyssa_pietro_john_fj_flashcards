class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :deck, index: true
      t.references :user, index: true
      t.integer :correct_on_first_guess

      t.timestamps null: false
    end
  end
end
