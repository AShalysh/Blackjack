class Card
  attr_reader :name, :suit

  SUITS = ["hearts", "club", "spade", "diamond"]
  NAMES = ["2","3","4","5", "6","7","8","9","10","J","Q","K","A"]

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def value
    if ["J","Q","K"].include?(@name) then 10
    elsif @name == "A" then 11
    else
      @name.to_i
    end
  end

  def humanize
    "#{@name} #{@suit.capitalize}"
  end
end
