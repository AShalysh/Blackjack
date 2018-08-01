class Bank
  attr_reader :player, :dealer

  BET_AMOUNT = 10

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @current_bank = 0
  end

  def take_bet
    @current_bank += @dealer.make_bet(BET_AMOUNT)
    @current_bank += @player.make_bet(BET_AMOUNT)
  end

  def win(person)
    person.amount += @current_bank
    @current_bank = 0
  end

  def draw
    @player.amount += @current_bank/2
    @dealer.amount += @current_bank/2
  end
end
