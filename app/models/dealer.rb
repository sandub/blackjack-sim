require_relative './card'

class Dealer
  attr_reader :cards

  def initialize deck
    @cards = []
    @deck = deck
  end

  def deal target
    @betSize = target.bet
    target.receive_cards([@deck.top])
    @cards << @deck.top
    target.receive_cards([@deck.top])
    @cards << @deck.top
  end
end

