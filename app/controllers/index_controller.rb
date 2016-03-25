get '/flashcards' do
  @decks = Deck.all
  erb :'/flashcards/index'
end

post '/games' do
  @deck = Deck.where(params[:game_info][:deck_id])
  if logged_in?
    binding.pry
    @game = Game.create(@deck.id, current_user.id)
  else
    @game = Game.create(@deck.id, 0)
  end
  redirect "games/#{@game.id}"
end

