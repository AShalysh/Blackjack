class Interface
  attr_accessor :player, :dealer, :deck
  def user_given_player_name
    request_player_name
    gets.chomp
  end

  def request_player_name
    puts 'What is your name?'
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
    puts "Play again? yes/no"
    gets.chomp
  end

  def bank_statements
    puts "BANK -- Player: #{@player.bank}, Dealer: #{@dealer.bank}"
  end


  # Break up puts into interface
  # def choose_option
  #   loop do 
  #     puts "Select option from the following"
  #     puts "skip" if !@player.skipped?
  #     puts "add" if !@player.added?
  #     puts "open"
  #     option = gets.chomp

  #     if option == "skip" && @player.skipped?
  #       "no skipping"
  #       next
  #     end 

  #     if option == "add" && @player.skipped?
  #       "no adding"
  #       next 
  #     end

  #     break;
  #   end

  #   option
  #   # skip, add, open
  # end


 
end
