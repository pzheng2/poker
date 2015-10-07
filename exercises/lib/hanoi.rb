class HanoiGame

  attr_accessor :board

  def initialize(tower_size = 3)
    @board = [[],[],[]]
    tower_size.times do |i|
      board[0] << i + 1
    end
  end

  def render
    print board
  end

  def move(start_tower, end_tower)
    raise ArgumentError if board[start_tower].empty?
    raise ArgumentError if !board[end_tower].empty? && board[start_tower].first > board[end_tower].first
    disk = board[start_tower].shift
    board[end_tower].unshift(disk)
    nil
  end

  def won?
    @board[0].empty? && @board[1].empty?
  end

end
