get '/games/:id' do
  erb :'games/show'
end

post '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @cards = @game.deck.cards
  @random_card = @cards.sample
  @cards.delete(@random_card)
  if @cards.length > 0
    redirect 'games/:id'
  else

  end
end
