class Person
  attr_accessor :hand, :bank

  def initialize
    @bank = 100
    @hand = []
  end

  def take_bet
    @bank -= 10
  end

  def hand_value
    total_value = 0
    hand.each do |card|
      total_value += card.value
    end

    if total_value > 21
      hand.each do |card|
        if card.name == "A"
          total_value -= 10
          break if total_value <= 21
        end
      end
    end

    total_value
  end

  def humanize_hand
    hand_readable = ""
    hand.each do |card|
      hand_readable.concat(card.humanize + " \n")
    end  
    hand_readable
  end



end
