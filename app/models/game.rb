class Game < ActiveRecord::Base
  has_one :deck
  belongs_to :user
  has_many :guesses

  def cards_in_deck(deck_id)
    Deck.find(deck_id).cards.length
  end


  def correct_on_first_guess

  end

  def total_guesses
    Game.guesses
  end

end
