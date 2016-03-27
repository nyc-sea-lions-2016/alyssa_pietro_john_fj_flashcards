class Deck < ActiveRecord::Base
  has_one :game
  has_many :cards
  validates :name, presence: true, uniqueness: true

  def cards_in_deck(deck_id)
    Deck.find(deck_id).cards.length
  end
end
