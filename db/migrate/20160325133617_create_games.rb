class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :deck
      t.references :user
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
