require 'csv'


countries_capitals_flashcards = '/seeds/countries_capitals_flashcards.csv'

first_deck = Deck.create(name: "Countries and Capitals")

options = {headers: true}
deck_info_1 = {deck_id: first_deck.id}

CSV.foreach(countries_capitals_flashcards, options) do |line|
  Card.create(line.merge(deck_info_1))
end


country_abbrev_flashcards = '/seeds/country_abbrev_flashcards.csv'

second_deck = Deck.create(name: "Countries and Abbreviations")

options = {headers: true}
deck_info_2 = {deck_id: second_deck.id}

CSV.foreach(countries_capitals_flashcards, options) do |line|
  Card.create(line.merge(deck_info_2))
end
