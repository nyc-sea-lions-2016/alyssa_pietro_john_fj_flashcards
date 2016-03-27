class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  validates :entry, presence: true

  def self.first_guess?(game_id, card_id)
    card_guesses = Guess.where(game_id: game_id, card_id: card_id)
    card_guesses.length == 1
  end
end
