class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :game
  validates :name, presence: true, uniqueness: true

  def deck_name(deck_id)
    my_deck = Deck.find_by(id: deck_id)
    my_deck.name
  end
end
