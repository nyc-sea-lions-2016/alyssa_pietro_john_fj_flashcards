get '/flashcards' do
  @decks = Deck.all
  erb :'/flashcards/index'
end