require 'minitest/autorun'
require_relative '../../app/models/deck.rb'
require_relative '../../app/models/card.rb'

describe Deck do

  before do
    @deck = Deck.new
  end

  describe "#initialize" do
    it "is a Deck" do
      @deck.must_be_instance_of Deck
    end

    it "has 52 cards" do
      @deck.size.must_be :==, 52
    end

    it "has an As" do
      card = Card.new "As"
      @deck.cards.count(card).must_be :==, 1
    end
  end

  describe "#shuffle" do
    it "is random" do
      card1 = @deck.cards.first
      @deck.shuffle
      card2 = @deck.cards.first
      card1.wont_be :==, card2
    end
  end
end