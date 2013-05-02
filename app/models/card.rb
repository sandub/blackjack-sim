class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize rank, suit = nil
    if suit.nil?
      @rank = rank_from_string(rank[0])
      @suit = rank[1]
    else
      @rank = rank
      @suit = suit
    end
  end

  def value
    string_from_rank(@rank) + @suit
  end

  def <=> other_card
    if self.rank < other_card.rank
      -1
    elsif self.rank > other_card.rank
      1
    else
      suit_compare self, other_card
    end
  end

  def color
    case @suit
    when 's', 'c'
      :black
    else
      :red
    end
  end

  private

  def rank_from_string string
    case string
    when 'A'
      1
    when 'J'
      11
    when 'Q'
      12
    when 'K'
      13
    else
      string.to_i
    end
  end

  def string_from_rank rank
    case rank
    when 1
      'A'
    when 11
      'J'
    when 12
      'Q'
    when 13
      'K'
    when 14
      'A'
    else
      rank.to_s
    end
  end

  private

  def suit_compare card1, card2
    suits = ['d','c','h','s']

    if card1.suit == card2.suit
      0
    elsif suits.index(card1.suit) < suits.index(card2.suit)
      -1
    else
      1
    end
  end
end