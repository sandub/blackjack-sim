require 'minitest/autorun'
require_relative '../../app/models/dealer.rb'
require_relative '../../app/models/card.rb'
require_relative '../../app/models/player.rb'

describe Dealer do
  before do
    @dealer = Dealer.new
  end

  describe "#initialize" do
    it "is a Dealer" do
      @dealer.must_be_instance_of Dealer
    end
  end

  describe "#deal" do
    it "will deal a card to itself" do
      @dealer.deal @dealer
      card = @dealer.cards[0]
      @dealer.cards.first.must_be_instance_of Card
    end

    it "will deal a card to a player" do
      player = Player.new
      @dealer.deal player
      player.cards.first.must_be_instance_of Card
    end
  end

  describe "#deck" do
    it "has a deck" do
      assert_respond_to @dealer, :deck
    end
  end
end