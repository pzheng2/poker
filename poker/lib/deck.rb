require_relative 'card'


class PokerError < StandardError
end

class Deck

  attr_accessor :cards
  SUITS = [:diamonds, :hearts, :clubs, :spades]
  VALUES = (1..13).to_a

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle
  end

  def draw_card
    raise PokerError if cards.empty?
    cards.shift
  end


end
