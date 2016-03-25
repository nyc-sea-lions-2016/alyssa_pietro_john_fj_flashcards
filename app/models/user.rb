class User < ActiveRecord::Base
  has_many :games
  #has_many :guesses through games

  has_secure_password



end
