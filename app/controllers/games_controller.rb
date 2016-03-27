get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @deck = Deck.find_by(id: @game.deck_id)
  @cards_log = cookies["game_cards_#{@game.id}"] || nil
  @game_id = @game.id

  if @cards_log && Card.num_cards_in_string(@cards_log) > 0
    @cards = Card.get_cards(@cards_log)
    @card_ids = Card.card_ids_string(@cards)
    @random_card = @cards.sample
    response.set_cookie("game_cards_#{@game.id}", :value => @card_ids)
  elsif @cards_log && Card.num_cards_in_string(@cards_log) == 0
    @cards = Card.get_cards(@cards_log)
    @card_ids = Card.card_ids_string(@cards)
    @game_over = true
    @game.correct_on_first_guess = Card.num_cards_in_string(cookies["correct_cards_#{@game.id}"])
  else
    @cards = Card.cards_in_game(@deck.id)
    @card_ids = Card.card_ids_string(@cards)
    response.set_cookie("game_cards_#{@game.id}", :value => @card_ids)
    binding.pry
    @random_card = @cards.sample
  end

  erb :'games/show'
end

post '/games/:id' do
  # user response, game_id, current_card are passed through
  @user_response = params[:game_info][:response]
  @game_id = params[:id]
  @current_card = params[:game_info][:current_card]

  #create instance of user guess to relate to game
  user_guess = Guess.create(card_id: @current_card, game_id: @game_id, entry: @user_response)

  # check if user answer was correct
  correct = Card.correct_answer?(@current_card, @user_response)

  # check if correct cards cookie already exists. if it doesn't set to empty string
  if !cookies["correct_cards_#{@game_id}"]
    response.set_cookie("correct_cards_#{@game_id}", :value => '')
  end

  # check if card is correct and that this is the first time guessing for this card
  if correct && Guess.first_guess?(@game_id, @current_card)
    correct_cards_for_cookie = cookies["correct_cards_#{@game_id}"] + " " + @current_card
    updated_game_cards = Card.remove_card(cookies["game_cards_#{@game_id}"], @current_card)
    response.set_cookie("correct_cards_#{@game_id}", :value => correct_cards_for_cookie)
    response.set_cookie("game_cards_#{@game_id}", :value => updated_game_cards)

  binding.pry

  elsif correct
    updated_game_cards = Card.remove_card(cookies["game_cards_#{@game_id}"], @current_card)
    response.set_cookie("game_cards_#{@game_id}", :value => updated_game_cards)
  else
    # do nothing and redirect
  end


  redirect "/games/#{@game_id}"
end

