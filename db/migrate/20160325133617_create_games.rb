class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :deck, index: true
      t.references :user, index: true 
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
