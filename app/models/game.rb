class Game < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  #NEED TO ADD VIRTUAL ATTRIBUTE METHODS
end
