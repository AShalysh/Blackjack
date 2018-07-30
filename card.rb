class Card
  attr_reader :name, :suit

  SUITS = ["hearts", "club", "spade", "diamond"]
  NAMES = ["2","3","4","5", "6","7","8","9","10","J","Q","K","A"]

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def value
    v = @name.to_i
    if v == 0
      v = if @name == "A"
        11
      else
        10
      end
    end
    v
  end

  def humanize
    "#{@name} #{@suit.capitalize}"
  end
end
