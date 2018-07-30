class MainProgramm
  def initialize(interface)
    @interface = interface
  end

  def start
    player_name = @interface.user_given_player_name.capitalize
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @interface.player = @player
    @interface.dealer = @dealer
    @interface.deck = @deck
    initiate_round
  end

  def initiate_round
    @deck.draw_card_for(@player, 2)
    @deck.draw_card_for(@dealer, 2)
    @interface.print_player_hand
    # @interface.print_dealer_hand_hidden
    # binding.pry
    @player.take_bet
    @dealer.take_bet
    turn(@player)
  end

  def skip(person)
    if person == @player
      if @player.skipped?
        @interface.player_skipped_already 
        return
      end
 
      @player.skip = true
      turn(@dealer)
    else
      if @player.added?
        open()
      else  
        turn(@player)
      end  
    end  
  end

  def add(person)
    @deck.draw_card_for(person, 1)

    if person == @player
      @interface.print_player_hand
      @player.skipped? ? open() : turn(@dealer)
    else      
      @player.added? ? open() : turn(@player)
    end  
  end  

  def turn(person)
    if person == @player
      @interface.print_dealer_hand_hidden if person
      player_turn()
    else  
      dealer_turn()
    end  
  end

  def player_turn
    option = choose_option    
    self.send(option,@player)
  end  

  def dealer_turn
    @dealer.hand_value >= 17 ? skip(@dealer) : add(@dealer)    
  end  

  def open(person = nil)
    @interface.print_player_hand
    @interface.print_dealer_hand

    if @player.hand_value > 21
      @interface.dealer_win
      @dealer.bank += 20
    elsif @dealer.hand_value > 21
      @interface.player_win
      @dealer.bank += 20
    elsif @player.hand_value == @dealer.hand_value
      @interface.draw
      @player.bank += 10
      @dealer.bank += 10
    elsif (21-@player.hand_value) < (21-@dealer.hand_value)
      @interface.player_win
      @player.bank += 20
    else
      @interface.dealer_win
      @dealer.bank += 20
    end  

    if @player.bank <= 0 || @dealer.bank <= 0 
      puts "game over"
      exit!
    end
    @interface.bank_statements
    option = @interface.restart_message

    if option == "yes"
      @deck.reset_deck!(@player, @dealer)
      @player.skip = false
      initiate_round
    else
      puts "bye bye"
    end
  end  
  
  def choose_option
    option = ""
    loop do 
      puts "Select option from the following"
      puts "skip" if !@player.skipped?
      puts "add" if !@player.added?
      puts "open"
      option = gets.chomp

      if option == "skip" && @player.skipped?
        puts "no skipping"
        next
      end 

      if option == "add" && @player.added?
        puts "no adding"
        next 
      end

      break;
    end
    
    option
  end

end