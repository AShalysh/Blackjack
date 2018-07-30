class Deck
  attr_reader :available_cards

  def initialize
    @available_cards = []
    Card::SUITS.each do |suit|
      ["2","3","4","5", "6","7","8","9","10","J","Q","K","A"].each do |name|
        @available_cards << Card.new(name, suit)
      end
    end
    shuffle_cards!  
  end

  def shuffle_cards!
    @available_cards.shuffle!
  end

  def draw_card_for(person, amount = 1)
    amount.times do
      card = @available_cards.shift
      person.hand << card
    end 
  end

  def reset_deck!(player, dealer)
    @available_cards.push(*player.hand) 
    @available_cards.push(*dealer.hand) 

    player.hand = []
    dealer.hand = []
    shuffle_cards!
  end  

end
