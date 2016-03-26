class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  validates :prompt, :answer, presence: true

  def self.cards_in_game(deck_id)
    Card.where(deck_id: deck_id)
  end

  def correct_answer?(card_id, response)
    card = Card.find_by(id: card_id)
    card.answer == response
  end

end
