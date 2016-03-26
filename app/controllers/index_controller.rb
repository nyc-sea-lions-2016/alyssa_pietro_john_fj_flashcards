get '/flashcards' do
  @decks = Deck.all
  erb :'/flashcards/index'
end

get '/flashcards/new' do
  @deck = Deck.new
  erb :'/flashcards/new'
end

post '/flashcards/new' do
  binding.pry
  return "Hello World"
  @deck = Deck.new #(params[:deck][:name])
  @card = Card.new
  if @deck.save
    redirect '/'
  else
    erb :'/flashcards/new'
  end
end

post '/games' do
  @deck = Deck.find_by(id: params[:game_info][:deck_id])
  if logged_in?
    @game = Game.create(@deck.id, current_user.id)
    response.set_cookie("current_game_#{@game.id}", :value => {deck_id: @deck.id})
  else
    @game = Game.create(@deck.id, 0)
  end
  redirect "games/#{@game.id}"
end

