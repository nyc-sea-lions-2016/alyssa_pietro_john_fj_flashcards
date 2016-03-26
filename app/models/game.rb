class Game < ActiveRecord::Base
  has_one :deck
  belongs_to :user
  has_many :guesses

  def cards_in_deck

  end


  def correct_on_first_guess

  end

  def total_guesses

  end

end
