get "/decks" do
  @decks = Deck.all
  erb :"decks/index"
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  erb :"decks/show"
end



post "/rounds" do
  @round = Round.create(deck_id: params[:deck_id])
  next_card = @round.next_card
  redirect "/rounds/#{@round.id}/cards/#{next_card.id}"
end

require 'pry'
get "/rounds/:round_id/cards/:card_id" do

  @round = Round.find_by(id: params[:round_id])
  @card = Card.find(params[:card_id])

  erb :"cards/show"
    #find the round
  #find the card
  #show that shit
end

post "/guesses" do
  @round = Round.find_by(id: params[:id])
  @guess = Round.guesses.find_by(id: params[:id])
  # @card = @round.deck.cards.first
  @round.next_card
    if @round.deck.remaining_cards.empty?
      redirect "/round/#{@round.id}"
    else
      redirect "/rounds/#{round.id}/cards/#{next_card.id}"
    end

  #create the guess
  # get the round
  # get the next card
  # redirect to round/card if card exists
  # redirect to round/id if no card
end

get "/rounds/:id" do
  erb :"rounds/show"
end
