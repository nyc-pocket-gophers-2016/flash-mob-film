class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def correctly_answered_cards
    guesses.where(correct_answer: true).collect{ |guess| guess.card }
  end

  def remaining_cards
    deck.cards - correctly_answered_cards
  end

  def next_card
    remaining_cards.sample
  end
end
