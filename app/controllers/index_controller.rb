get '/flashcards' do
  @decks = Deck.all
  erb :'/flashcards/index'
end

post '/games' do
  @deck = Deck.new
  @deck.id = params[:game_info][:deck_id]
  if logged_in?
    @game = Game.create(deck_id, user_id)
  else
    @game = Game.create(deck_id, user_id = 0)
  end
  redirect "games/#{@game.id}"
end

