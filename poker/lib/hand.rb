class Hand
  attr_accessor :cards
  def initialize

  end

  def flush
    cards.all? { |card| card.suit == cards.first.suit }
  end

  def straight
    sorted_values = values.sort
    (sorted_values.last - sorted_values.first) == 4
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
