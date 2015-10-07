require_relative 'deck'
require_relative 'player'


class Game
  attr_accessor :deck, :players

  def initialize(*players)
    @deck = Deck.new
    @players = players
    @current_player = @players.first
    @pot = 0
  end

  def deal_hand(player)
    5.times do
      deal_card(player)
    end
  end

  def deal_new_hands
    @deck = Deck.new
    players.each do |player|
      player.hand = []
      deal_hand(player)
      player.current_bet = 0
    end
  end

  def deal_card(player)
    player.hand << deck.draw_card
  end

  def max_bet
    max_bet = 0
    players.each do |player|
      max_bet = player.current_bet if player.current_bet > max_bet
    end
    max_bet
  end

  def play_hand
    players_in_round = []
    player_bet = 0
    deal_new_hands
    players.each do |player|
      bet_choice = player.get_bet_choice
      if bet_choice == "r"


        player_bet = player.make_bet
        player.stake -= player_bet
        player.current_bet += player_bet
        @pot += player_bet # this should prevent betting below the 'call' amount, but it does not.
      elsif bet_choice == "s"
        player_bet = max_bet - player.current_bet
        player.stake -= player_bet
        player.current_bet = max_bet
        @pot += player_bet
      else
        players_in_round.delete(player)
      end
      players_in_round << player unless bet_choice == "f" || players_in_round.include?(player)
    end
  end



end

if $PROGRAM_NAME == __FILE__
  poker = Game.new(Player.new("Bob", 1000),Player.new("Alice", 1000))
  poker.play_hand
end
