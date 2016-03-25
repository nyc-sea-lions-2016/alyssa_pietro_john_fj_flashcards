require 'csv'



countries_capitals_flashcards = '/Users/FJ_Junior/Development/code/phase-0-curriculum/phase-1/phase-2-flashcards-app/alyssa_pietro_john_fj_flashcards/db/seeds/countries_capitals_flashcards.csv'

first_deck = Deck.create(name: "Countries and Capitals")

options = {headers: true,
header_converters: :symbol
}
deck_info_1 = {deck_id: first_deck.id}

CSV.foreach(countries_capitals_flashcards, options) do |line|
  temp = Hash.new
  temp[:prompt] = line[:prompt]
  temp[:answer] = line[:answer]
  temp[:deck_id] = first_deck.id
  Card.create(temp)
end


country_abbrev_flashcards = '/Users/FJ_Junior/Development/code/phase-0-curriculum/phase-1/phase-2-flashcards-app/alyssa_pietro_john_fj_flashcards/db/seeds/country_abbrev_flashcards.csv'

second_deck = Deck.create(name: "Countries and Abbreviations")

options = {headers: true,
header_converters: :symbol
}
deck_info_2 = {deck_id: second_deck.id}

CSV.foreach(country_abbrev_flashcards, options) do |line|
  temp = Hash.new
  temp[:prompt] = line[:prompt]
  temp[:answer] = line[:answer]
  temp[:deck_id] = second_deck.id
  Card.create(temp)
end


easy_flashcards = '/Users/FJ_Junior/Development/code/phase-0-curriculum/phase-1/phase-2-flashcards-app/alyssa_pietro_john_fj_flashcards/db/seeds/easy_flashcards.csv'

third_deck = Deck.create(name: "Repeat After Me")

options = {headers: true,
header_converters: :symbol
}
deck_info_3 = {deck_id: third_deck.id}

CSV.foreach(easy_flashcards, options) do |line|
  temp = Hash.new
  temp[:prompt] = line[:prompt]
  temp[:answer] = line[:answer]
  temp[:deck_id] = third_deck.id
  Card.create(temp)

end
