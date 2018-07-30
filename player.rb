class Player < Dealer
  attr_reader :name
  attr_accessor :skip

  def initialize(name)
    @name = name
    super()
  end

  def skipped?
    skip
  end

  def added?
    hand.count == 3
  end
end
