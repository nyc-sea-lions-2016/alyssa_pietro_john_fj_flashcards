class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :game
  validates :name, presence: true, uniqueness: true
end
