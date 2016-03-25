class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.references :game

      t.timestamps, null: false
    end
  end
end
