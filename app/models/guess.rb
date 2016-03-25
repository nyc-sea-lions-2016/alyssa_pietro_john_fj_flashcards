class Guess < ActiveRecord::Base
  belongs_to :card, :game
  validates :guess, presence: true
end
