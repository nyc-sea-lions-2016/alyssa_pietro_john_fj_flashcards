class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games
#has_many :guesses through games

  has_secure_password

end
