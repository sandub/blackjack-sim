require_relative '../lib/card.rb'

describe Card do

  describe "#initialize" do

    it "stores an ordinal and a suit" do
      card = Card.new 2, 'd'
      expect(card.value).to eq '2d'
    end

    it "accepts a short string" do
      card = Card.new 'Kh'
      expect(card.value).to eq 'Kh'
    end
  end

  describe "#value" do

    it "shows A for ordinal of 1" do
      card = Card.new 1, 's'
      expect(card.value).to eq 'As'
    end

    it "shows J for ordinal of 11" do
      card = Card.new 11, 'c'
      expect(card.value).to eq 'Jc'
    end

    it "shows Q for ordinal of 12" do
      card = Card.new 12, 'h'
      expect(card.value).to eq 'Qh'
    end

    it "shows K for ordinal of 13" do
      card = Card.new 13, 'd'
      expect(card.value).to eq 'Kd'
    end

    it "accepts letters instead of ordinals" do
      card = Card.new 'Q', 's'
      expect(card.value).to eq 'Qs'
    end

    it "shows A for ordinal of 14" do
      card = Card.new 14, 'c'
      expect(card.value).to eq 'Ac'
    end

  end

  describe "#<=>" do

    it "is equal to a card in a different suit" do
      card1 = Card.new '7h'
      card2 = Card.new '7s'
      expect(card1 == card2).to eq true
    end

    it "can compare to a bigger card" do
      card1 = Card.new 'Jd'
      card2 = Card.new 'Kc'
      expect(card1 < card2).to eq true
    end

    it "can compare to a smaller card" do
      card1 = Card.new 'Qh'
      card2 = Card.new '2s'
      expect(card1 > card2).to eq true
    end

  end

  describe "#color" do

    it "should return black for spades" do
      card = Card.new '7s'
      expect(card.color).to eq :black
    end

    it "should return red for hearts" do
      card = Card.new '5h'
      expect(card.color).to eq :red
    end

    it "should return black for clubs" do
      card = Card.new 'Q', 'c'
      expect(card.color).to eq :black
    end

    it "should return red for diamonds" do
      card = Card.new 1, 'd'
      expect(card.color).to eq :red
    end

  end

end