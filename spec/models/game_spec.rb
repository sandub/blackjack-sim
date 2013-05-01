require 'minitest/autorun'
require_relative '../../app/models/game.rb'

describe Game do
  before do
    @game = Game.new
  end

  describe "when started" do
    it "should give a bankroll of 1000" do
      @game.bankroll.must_be :==, 1000
    end

    it "should start with a bet size of 10" do
      @game.betsize.must_be :==, 10
    end
  end

  describe "the deal" do
    it "should deal 2 cards to the dealer" do
      @game.deal
      @game.dealer_cards.size.must_be :==, 2
    end

    it "should deal 2 cards to the player" do
      @game.deal
      @game.player_cards.size.must_be :==, 2
    end

    it "should be dealing random cards" do
      @game.deal
      initial_card = @game.dealer_cards[0]
      @game = Game.new
      @game.deal
      @game.dealer_cards[0].wont_equal initial_card
    end
  end

end