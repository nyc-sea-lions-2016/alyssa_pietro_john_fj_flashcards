class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  validates :entry, presence: true
end
