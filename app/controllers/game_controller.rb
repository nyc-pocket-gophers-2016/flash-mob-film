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
end

post "/guesses" do
  @round = Round.find_by(id: params[:round_id])
  @guess = @round.guesses.find_by(id: params[:guess_id])
  @card = @round.next_card
    if @round.remaining_cards.empty?
      redirect "/rounds/#{@round.id}"
    else
      redirect "/rounds/#{@round.id}/cards/#{@card.id}"
    end
end

get "/rounds/:id" do
  erb :"rounds/show"
end
