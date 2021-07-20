class Game
  attr_reader :board
  def initialize(board, player_one_marker, player_two_marker)
    @board = board
    @player_one_marker = player_one_marker
    @player_two_marker = player_two_marker
  end

  def submit_move(position, marker)
    @board.mark(position, marker)
  end

  def view_board
    @board.view
  end
end