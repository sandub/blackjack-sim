require_relative './card'

class Deck
  attr_accessor :cards, :discard

  CARD_VALUES = [
    "As", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "10s", "Js", "Qs", "Ks",
    "Ah", "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "10h", "Jh", "Qh", "Kh",
    "Ac", "2c", "3c", "4c", "5c", "6c", "7c", "8c", "9c", "10c", "Jc", "Qc", "Kc",
    "Ad", "2d", "3d", "4d", "5d", "6d", "7d", "8d", "9d", "10d", "Jd", "Qd", "Kd",
  ]

  def initialize
    @cards = Array.new
    @discard = Array.new
    CARD_VALUES.each do |card|
      8.times do
        cards << Card.new(card)
      end
    end
  end

  def top
    result = @cards.shift
    @discard << result
    result
  end

  def shuffle
    @cards.shuffle!
  end

  def size
    @cards.size
  end
end