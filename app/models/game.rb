class Game < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  validates :name, presence: true
  #NEED TO ADD VIRTUAL ATTRIBUTE METHODS
end
