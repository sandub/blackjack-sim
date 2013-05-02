require 'minitest/autorun'
require_relative '../../app/models/card.rb'

describe Card do

  describe "#initialize" do

    it "stores an ordinal and a suit" do
      card = Card.new 2, 'd'
      assert_equal '2d', card.value
    end

    it "accepts a short string" do
      card = Card.new 'Kh'
      assert_equal 'Kh', card.value
    end
  end

  describe "#value" do

    it "shows A for ordinal of 1" do
      card = Card.new 1, 's'
      assert_equal 'As', card.value
    end

    it "shows J for ordinal of 11" do
      card = Card.new 11, 'c'
      assert_equal 'Jc', card.value
    end

    it "shows Q for ordinal of 12" do
      card = Card.new 12, 'h'
      assert_equal 'Qh', card.value
    end

    it "shows K for ordinal of 13" do
      card = Card.new 13, 'd'
      assert_equal 'Kd', card.value
    end

    it "accepts letters instead of ordinals" do
      card = Card.new 'Q', 's'
      assert_equal 'Qs', card.value
    end

    it "shows A for ordinal of 14" do
      card = Card.new 14, 'c'
      assert_equal 'Ac', card.value
    end

  end

  describe "#<=>" do

    it "hearts are less than spades" do
      card1 = Card.new '7h'
      card2 = Card.new '7s'
      assert card1 < card2, "7h should be < 7s"
    end

    it "can compare to a bigger card" do
      card1 = Card.new 'Jd'
      card2 = Card.new 'Kc'
      assert card1 < card2, "Jd should be < Kc"
    end

    it "can compare to a smaller card" do
      card1 = Card.new 'Qh'
      card2 = Card.new '2s'
      assert card1 > card2, "Qh should be > 2s"
    end

  end

  describe "#color" do

    it "should return black for spades" do
      card = Card.new '7s'
      assert_equal :black, card.color
    end

    it "should return red for hearts" do
      card = Card.new '5h'
      assert_equal :red, card.color
    end

    it "should return black for clubs" do
      card = Card.new 'Q', 'c'
      assert_equal :black, card.color
    end

    it "should return red for diamonds" do
      card = Card.new 1, 'd'
      assert_equal :red, card.color
    end

  end

end