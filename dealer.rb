class Dealer
  attr_accessor :hand, :amount

  def initialize
    @amount = 100
    @hand = []
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

  def make_bet(bet_amount)
    @amount -= bet_amount
    bet_amount
  end
end
