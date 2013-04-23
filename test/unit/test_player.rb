require 'minitest/autorun'
require_relative '../../app/models/player.rb'
require_relative '../../app/models/card.rb'

describe Player do
  before do
    @player = Player.new
  end

  describe "#initialize" do
    it "is a Player" do
      @player.must_be_instance_of Player
    end

    it "responds to cards" do
      assert_respond_to @player, :cards
    end

    it "will take a card" do
      @player.cards << Card.new('4d')
      @player.cards.first.value.must_equal '4d'
    end
  end
end