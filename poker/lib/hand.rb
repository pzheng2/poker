class Hand
  attr_accessor :cards
  def initialize(cards = [])
    @cards = cards
  end

  def flush
    cards.all? { |card| card.suit == cards.first.suit }
  end

  def straight
    sorted_values = values.sort
    (sorted_values.last - sorted_values.first) == 4 && (sorted_values == sorted_values.uniq)
  end

  def full_house
    value_counts = unique_value_count
    value_counts.values.sort == [2, 3]
  end

  def straight_flush
    straight && flush
  end

  def four_of_a_kind
    value_counts = unique_value_count
    value_counts.values.sort == [1, 4]
  end

  def three_of_a_kind
    value_counts = unique_value_count
    value_counts.values.sort == [1, 1, 3]
  end

  def two_pair
    value_counts = unique_value_count
    value_counts.values.sort == [1, 2, 2]
  end

  def pair
    value_counts = unique_value_count
    value_counts.values.sort == [1, 1, 1, 2]
  end
  def is_higher?(other_hand)
    hand_rank < other_hand.hand_rank
  end

  def hand_rank
    return 1 if straight_flush
    return 2 if four_of_a_kind
    return 3 if full_house
    return 4 if flush
    return 5 if straight
    return 6 if three_of_a_kind
    return 7 if two_pair
    return 8 if pair
    return 9
  end


  private
  def values
    cards.map { |card| card.value }
  end

  def suits
    cards.map { |card| card.suit }
  end

  def unique_value_count
    value_counts = {}
    values.uniq.map { |value| value_counts[value] = values.count(value) }
    value_counts
  end

end
