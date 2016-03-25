get '/games/:id' do
  erb :'games/show'
end

post '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @cards = Card.cards_in_game(@game.id)
  if @cards.length > 0
    @random_card = @cards.sample
    @cards.delete(@random_card)
    redirect 'games/:id'
  else
    #logic for game over
    redirect 'games/:id'
  end
end

#stuff
sessions[:game_id] = []
