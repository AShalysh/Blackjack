class Card
  attr_reader :name, :suit

  SUITS = ["hearts", "club", "spade", "diamond"]
  NAMES = ["2","3","4","5", "6","7","8","9","10","J","Q","K","A"]

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def value
    val_card = @name.to_i
    if ["J","Q","K","A"].include?(@name)
      val_card = if @name == "A"
        11
      else
        10
      end
    end
    val_card
  end

  def humanize
    "#{@name} #{@suit.capitalize}"
  end
end
