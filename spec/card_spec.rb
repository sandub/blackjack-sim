require_relative '../lib/card.rb'

describe Card do

  describe "#initialize" do

    it "stores an ordinal and a suit" do
      card = Card.new 2, 'd'
      expect(card.value).to eq '2d'
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

  end
end