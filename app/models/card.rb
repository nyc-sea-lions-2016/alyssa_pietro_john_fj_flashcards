class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  validates :prompt, :answer, presence: true

  def cards_in_game(game_id)
    Card.where(game_id: game_id)
  end

end
