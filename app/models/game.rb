class Game < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  validates :name, presence: true
  #NEED TO ADD VIRTUAL ATTRIBUTE METHODS
end
