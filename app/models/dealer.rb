require_relative './card'

class Dealer
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def deal target
    @betSize = target.bet
    target.receive_cards(Card.new("2c"))
    @cards << Card.new("Ad")
    target.receive_cards(Card.new("5d"))
    @cards << Card.new("5c")
  end
end