class Game < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def correct_on_first_guess

  end

  def total_guesses
    Game.guesses
  end

end
