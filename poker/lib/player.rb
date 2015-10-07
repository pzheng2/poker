require_relative 'deck'

class Player
attr_accessor :hand, :current_bet, :stake

  def initialize(name, stake)
    @name = name
    @hand = []
    @stake = stake
    @current_bet = 0
  end

  def get_discard_choice
    to_discard = []
    begin
    puts "Enter the number of cards to discard."
    discard_num = Integer(STDIN.gets.chomp)
    raise PokerError unless discard_num.between?(1,3)
      discard_num.times do |i|
        begin
          puts "Enter the position of the card to be discarded."
          card_choice = Integer(STDIN.gets.chomp)
          raise PokerError unless card_choice.between?(0,4) && !to_discard.include?(card_choice)
          to_discard << card_choice
        rescue PokerError, ArgumentError => e
          p e.message
          retry
        end
      end
    rescue PokerError, ArgumentError => e
      p e.message
      retry
    end

    to_discard
  end

  def get_bet_choice
    options = ["f", "s", "r"]
    begin
      puts "Enter bet choice (F-fold, S-see or R-raise): "
      choice = STDIN.gets.chomp.downcase
      raise PokerError unless options.include?(choice)
    rescue PokerError => e
      retry
    end

    choice
  end

  def make_bet
    puts "Enter bet amount: "
    bet_amount = Integer(STDIN.gets.chomp)
    rescue ArgumentError => e
      p e.message
      retry


    bet_amount
  end



end


if $PROGRAM_NAME == __FILE__
  player_one = Player.new("Roger", 500)
  player_one.get_discard_choice

end
