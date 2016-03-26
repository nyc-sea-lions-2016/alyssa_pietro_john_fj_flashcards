class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  validates :prompt, :answer, presence: true

  def self.cards_in_game(deck_id)
    Card.where(deck_id: deck_id)
  end

  def self.correct_answer?(card_id, response)
    card = Card.find_by(id: card_id)
    card.answer == response
  end

  def self.card_ids_string(cards)
    cards.map{|card| card.id}.join(' ')
  end

  def self.num_cards_in_string(cards_string)
    cards_string
    # count number of card ids in string and return integer
  end

  def self.get_cards(card_id_string)
    #create array of card objects. find objects using card ids stored in string, separated by space
    string.split()
  end

end

