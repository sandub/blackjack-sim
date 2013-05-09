class Game
  attr_reader :dealer, :player

  def initialize args
    @dealer = args[:dealer]
    @player = args[:player]
  end

  def simulate
    @dealer.deal @player, @player.bet
  end
end

