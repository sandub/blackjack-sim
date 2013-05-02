require 'minitest/autorun'
require_relative '../../app/models/dealer.rb'
require_relative '../../app/models/card.rb'

describe Dealer do
  before do
    @dealer = Dealer.new
  end

  describe "#deal" do
    before do
      @player = Minitest::Mock.new
      @player.expect :bet, 1
      card1 = Card.new("2c")
      card2 = Card.new("5d")
      @player.expect :receive_cards, card1, [card1]
      @player.expect :receive_cards, card2, [card2]
      @dealer.deal @player
    end

    it "will deal 2 cards to itself" do
      assert_instance_of(Card, @dealer.cards[0])
      assert_instance_of(Card, @dealer.cards[1])
    end

    it "will deal 2 cards to the player" do
      @player.verify
    end
  end

end
