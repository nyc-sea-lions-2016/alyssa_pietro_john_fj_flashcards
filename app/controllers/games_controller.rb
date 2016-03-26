get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @deck = Deck.find_by(id: @game.deck_id)
  @cards = request.cookies["game_cards_#{@game.id}"]

  if @cards && @cards.length > 0
    @random_card = @cards.sample
    response.set_cookie("game_cards_#{@game.id}", :value => @cards)
  elsif @cards && @cards.length == 0
    @game_over = true
    @game.correct_on_first_guess = request.cookies["correct_cards_#{@game.id}"].length
    #confirm that this is the name in the database (above)
  else
    binding.pry
    @cards = Card.cards_in_game(@deck.id)
    response.set_cookie("game_cards_#{@game.id}", :value => @cards)
    @random_card = @cards.sample
  end

  erb :'games/show'
end

post '/games/:id' do
  @user_response = params[:game_info][:response]
  @game_id = params[:id]
  @cards = request.cookies["correct_cards_#{@game.id}"]
  correct_cards = request.cookies["correct_cards_#{@game.id}"]
  @current_card = params[:game_info][:current_card]
  correct = Card.correct_answer?(@current_card.id, @user_response)

  unless correct_cards
    correct_cards = response.set_cookie("correct_cards_#{@game.id}", :value => [])
  end

  user_guess = Guess.create(card_id: @current_card.id, game_id: @game_id, entry: @user_response)

  if correct && Guess.first_guess?(@game_id, @current_card.id)

    # add card obj to correct cards hash
    # delete card from @cards cookie
    response.set_cookie("correct_cards_#{@game.id}", :value => [])
  elsif correct
    # delete card from @cards cookie
  else
    # do nothing and redirect
  end


  redirect 'games/:id'
end

