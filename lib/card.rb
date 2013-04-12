class Card
  def initialize ordinal, suit
    @ordinal = ordinal
    @suit = suit
  end

  def value
    string_from_ordinal(@ordinal) + @suit
  end

  private

  def string_from_ordinal ordinal
    case ordinal
    when 1
      'A'
    when 11
      'J'
    when 12
      'Q'
    when 13
      'K'
    else
      ordinal.to_s
    end
  end
end