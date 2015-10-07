require_relative 'deck'

class Player


  def initialize(name, pot)
    @name = name
    @hand = []
    @pot = pot
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
          retry
          p e.message
        end
      end
    rescue PokerError, ArgumentError => e
      retry
      p e.message
    end


    to_discard
  end

end


if $PROGRAM_NAME == __FILE__
  player_one = Player.new("Roger", 500)
  player_one.get_discard_choice

end
