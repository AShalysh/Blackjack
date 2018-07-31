class Dealer
  attr_accessor :hand
  attr_reader :bank

  BET_AMOUNT = 10
  WIN_AMOUNT = 20

  def initialize
    @bank = Bank.new(100)
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

  def take_bet
    @bank.amount -= BET_AMOUNT
  end

  def win
    @bank.amount += WIN_AMOUNT
  end

  def draw
    @bank.amount += BET_AMOUNT
  end
end
