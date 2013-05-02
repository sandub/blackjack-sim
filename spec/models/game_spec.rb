require 'minitest/autorun'
require_relative '../../app/models/game.rb'

describe Game do
  BET_SIZE = 1

  before do
    @dealer = Minitest::Mock.new
    @player = Minitest::Mock.new
    @game = Game.new dealer: @dealer, player: @player
  end

  describe "#start" do
    before do
      @player.expect :bet, BET_SIZE
      @dealer.expect :deal, true, [@player, BET_SIZE]
      @game.start
    end

    it "should tell the player to bet" do
      @player.verify
    end

    it "should tell the dealer to deal" do
      @dealer.verify
    end
  end

end

#rules

##Bitzino (-0.4% edge)##
#Blackjack pays 3:2
#Dealer hits soft 17
#Double on any two cards
#Can double after split
#Can hit and resplit split aces
#Split up to 4 hands
#Dealer peeks for blackjack
#8 decks
#Reshuffled every hand

##Vegas Strip (-0.34% edge)##
#4 Decks
#Dealer stands on soft 17
#Double after split allowed
#Resplit to three hands
#Dealer peeks for blackjack
#One bet position

##Betfair (0 edge)##
#Dealer draws to 16
#Dealer stands on 17
#Double down on 8,9,10,11
#Double down on splits
#No splitting aces
#Blackjack pays 3:2
#Suited blackjack pays 2:1
#5 card blackjack pays 2:1