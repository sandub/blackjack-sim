require 'minitest/autorun'
require_relative '../../app/models/deck.rb'
require_relative '../../app/models/card.rb'

describe Deck do

  before do
    @deck = Deck.new
  end

  describe "#initialize" do
    it "has 416 cards" do
      assert_equal 416, @deck.size
    end

    it "has an As" do
      card = Card.new "As"
      assert_equal 8, @deck.cards.count(card)
    end
  end

  describe "#shuffle" do
    it "is random" do
      card1 = @deck.cards.first
      @deck.shuffle
      card2 = @deck.cards.first
      refute_equal card1, card2
    end
  end

  describe "#top" do
    it "returns the first card" do
      card = @deck.cards.first
      assert_equal card, @deck.top
    end

    it "returns a different card next" do
      @deck.shuffle
      card1 = @deck.top
      card2 = @deck.top
      refute_equal card1, card2
    end

    it "moves the top card into the discard pile" do
      card = @deck.top
      assert_equal card, @deck.discard.first
    end
  end
end

