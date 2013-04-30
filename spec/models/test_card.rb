require 'minitest/autorun'
require_relative '../../app/models/card.rb'

describe Card do

  describe "#initialize" do

    it "stores an ordinal and a suit" do
      card = Card.new 2, 'd'
      card.value.must_be :==, '2d'
    end

    it "accepts a short string" do
      card = Card.new 'Kh'
      card.value.must_be :==, 'Kh'
    end
  end

  describe "#value" do

    it "shows A for ordinal of 1" do
      card = Card.new 1, 's'
      card.value.must_be :==, 'As'
    end

    it "shows J for ordinal of 11" do
      card = Card.new 11, 'c'
      card.value.must_be :==, 'Jc'
    end

    it "shows Q for ordinal of 12" do
      card = Card.new 12, 'h'
      card.value.must_be :==, 'Qh'
    end

    it "shows K for ordinal of 13" do
      card = Card.new 13, 'd'
      card.value.must_be :==, 'Kd'
    end

    it "accepts letters instead of ordinals" do
      card = Card.new 'Q', 's'
      card.value.must_be :==, 'Qs'
    end

    it "shows A for ordinal of 14" do
      card = Card.new 14, 'c'
      card.value.must_be :==, 'Ac'
    end

  end

  describe "#<=>" do

    it "hearts are less than spades" do
      card1 = Card.new '7h'
      card2 = Card.new '7s'
      card1.must_be :<, card2
    end

    it "can compare to a bigger card" do
      card1 = Card.new 'Jd'
      card2 = Card.new 'Kc'
      card1.must_be :<, card2
    end

    it "can compare to a smaller card" do
      card1 = Card.new 'Qh'
      card2 = Card.new '2s'
      card1.must_be :>, card2
    end

  end

  describe "#color" do

    it "should return black for spades" do
      card = Card.new '7s'
      card.color.must_be :==, :black
    end

    it "should return red for hearts" do
      card = Card.new '5h'
      card.color.must_be :==, :red
    end

    it "should return black for clubs" do
      card = Card.new 'Q', 'c'
      card.color.must_be :==, :black
    end

    it "should return red for diamonds" do
      card = Card.new 1, 'd'
      card.color.must_be :==, :red
    end

  end

end