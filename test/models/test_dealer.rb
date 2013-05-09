require 'minitest/autorun'
require 'mocha/setup'
require_relative '../../app/models/dealer.rb'
require_relative '../../app/models/card.rb'

describe Dealer do
  before do
    @deck = mock()
    @dealer = Dealer.new @deck
  end

  describe "#deal" do
    before do
      @player = MiniTest::Mock.new
      @player.expect :bet, 1
      @card0 = Card.new "As"
      @card1 = Card.new "4h"
      @card2 = Card.new "5d"
      @card3 = Card.new "Ac"
      the_deal = sequence('the_deal')
      @deck.expects(:top).returns(@card0).in_sequence(the_deal)
      @deck.expects(:top).returns(@card1).in_sequence(the_deal)
      @deck.expects(:top).returns(@card2).in_sequence(the_deal)
      @deck.expects(:top).returns(@card3).in_sequence(the_deal)
      @player.expect :receive_cards, [@card0], [Array]
      @player.expect :receive_cards, [@card2], [Array]
      @dealer.deal @player
    end

    it "will deal 2 cards to itself" do
      assert_includes @dealer.cards, @card1
      assert_includes @dealer.cards, @card3
    end

    it "will deal 2 cards to the player" do
      @player.verify
    end
  end

end

