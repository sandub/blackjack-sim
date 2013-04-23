require_relative './deck'

class Game
  attr_reader :bankroll, :dealer_cards, :player_cards
  attr_accessor :betsize

  def initialize 
    @bankroll = 1000
    @betsize = 10
    @dealer_cards = []
    @player_cards = []
    @deck = Deck.new
  end

  def deal
    @deck.shuffle
    @player_cards << @deck.cards.first
    @dealer_cards << @deck.cards.first
    @player_cards << @deck.cards.first
    @dealer_cards << @deck.cards.first
  end
end