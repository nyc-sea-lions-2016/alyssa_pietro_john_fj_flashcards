get '/decks/new' do
  erb :"decks/new"
end

post '/decks/new' do
  @deck = Deck.new(params[:deck])
  @card = Card.new(params[:card])
  if @deck.save
    redirect '/'
  else
    @errors = @deck.errors.full_messages
    erb :'/decks/new'
  end
end
