get '/games/:id' do
  binding.pry
  @game = Game.find_by(id: params[:id])
  @deck = Deck.find_by(id: @game.deck_id)
  @cards = request.cookies["game_cards_#{@game.id}"]

  if @cards && @cards.length > 0
    @random_card = @cards.sample
    @cards = @cards.delete_if{|card| card.id == @random_card.id}
    response.set_cookie("game_cards_#{@game.id}", :value => @cards)
  elsif @cards && @cards.length == 0
    @game_over = true
    #bring this back into view
  else
    @cards = Card.cards_in_game(@game.id)
    response.set_cookie("game_cards_#{@game.id}", :value => @cards)
  end

  erb :'games/show'
end

post '/games/:id' do
  @user_response = params[:game_info][:response]
  @game_id = params[:id]
  @cards = request.cookies["game_cards_#{@game_id}"]
  @current_card = params[:game_info][:current_card]

  if Card.correct_answer?(@current_card.id, @user_response)

  end


  redirect 'games/:id'
end
