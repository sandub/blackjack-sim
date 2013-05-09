require 'minitest/autorun'
require_relative '../../app/models/player.rb'
require_relative '../../app/models/card.rb'

describe Player do
  before do
    @player = Player.new
  end

  describe "#initialize" do
    it "responds to cards" do
      assert_respond_to @player, :cards
    end
  end

  describe "#receive_cards" do
    it "will take a card" do
      value = "4d"
      card = Card.new(value)
      @player.receive_cards [card]
      assert_equal value, @player.cards.first.value
    end

    it "will take multiple cards" do
      @player.receive_cards [Card.new("3c"), Card.new("Ah")]
      assert_equal 2, @player.cards.size
    end

    it "returns an array of the cards received" do
      card1 = Card.new("As")
      card2 = Card.new("5h")
      assert_equal [card1, card2], @player.receive_cards([card1, card2])
    end
  end
end