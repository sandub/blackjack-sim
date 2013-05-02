class Player
  attr_reader :cards

  def initialize
    @cards = []
  end

  def receive_cards cards
    cards.each do |c|
      @cards << c
    end
  end
end