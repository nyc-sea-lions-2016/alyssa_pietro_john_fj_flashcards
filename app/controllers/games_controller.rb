get '/games/:id' do
  binding.pry
  @game = Game.find_by(id: params[:id])
  @deck = Deck.find_by(id: @game.deck_id)
  @cards = Card.cards_in_game(@game.id)
  response.set_cookie("game_cards_#{@game.id}", :value => @cards)
  erb :'games/show'
end

post '/games/:id' do
  # @game = Game.find_by(id: params[:id])
  # @cards = Card.cards_in_game(@game.id)
  @game_id = params[:id]
  request.cookies["game_cards_#{@game_id}"]
  if @cards.length > 0
    @random_card = @cards.sample
    @cards.delete(@random_card)
    redirect 'games/:id'
  else
    #logic for game over
    redirect 'games/:id'
  end
end
