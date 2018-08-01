class Interface
  attr_accessor :player, :dealer, :deck
  def user_given_player_name
    request_player_name
    gets.chomp
  end

  def request_player_name
    puts "What is your name?"
  end

  def print_player_hand
    puts "Players hand:\n#{@player.humanize_hand}Value: #{@player.hand_value}\n------\n"
  end

  def print_dealer_hand_hidden
    puts "Dealers hand:"
    @dealer.hand.count.times do
      puts "Card: *"
    end
    puts "------\n"
  end

  def print_dealer_hand
     puts "Dealers hand:\n#{@dealer.humanize_hand}Value: #{@dealer.hand_value}\n------\n"
  end

  def player_skipped_already
    puts "Player has already skipped"
  end

  def player_win
    puts "player wins"
  end

  def dealer_win
    puts "dealer wins"
  end

  def draw
    puts "draw"
  end

  def restart_message
    puts "Play again? type yes/no: "
    gets.chomp
  end

  def bank_statements
    puts "BANK -- Player: #{@player.amount}, Dealer: #{@dealer.amount}"
  end

  def select_option
    puts "Select option from the following: "
  end

  def skip_option
    puts "skip"
  end

  def add_option
    puts "add"
  end

  def open_option
    puts "open"
  end

  def get_option
    gets.chomp
  end

  def no_skipping
    puts "no skipping"
  end

  def no_adding
    puts "no adding"
  end

  def game_over
    puts "Game over!"
  end

  def bye
    puts "Bye-Bye!"
  end
end
