class Card
  include Comparable
  attr_reader :rank

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
      0
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
end