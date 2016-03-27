get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/new' do
  erb :"decks/new"
end

post '/decks/new' do
  @deck = Deck.new(params[:deck])
  @deck.cards << Card.create(params[:card])
  if @deck.save
    redirect '/'
  else
    @errors = @deck.errors.full_messages
    erb :'/decks/new'
  end
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @cards = @deck.cards
  erb :'decks/show'
end

get '/decks/:id/edit' do

end
