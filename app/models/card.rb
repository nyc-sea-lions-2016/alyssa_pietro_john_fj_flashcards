class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  validates :prompt, :answer, presence: true

  def cards_in_game(game_id)
    Card.where(game_id: game_id)
  end

  def correct_answer?(card_id, response)
    card = Card.find_by(id: card_id)
    card.answer == response
  end

end
