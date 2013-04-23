require_relative './deck'

class Dealer
  attr_accessor :cards, :deck

  def initialize
    @cards = []
    @deck = Deck.new
    @deck.shuffle
  end

  def deal target
    target.cards << @deck.cards.first
  end
end