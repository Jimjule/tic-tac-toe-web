class Game
  attr_reader :board, :turn_count
  def initialize(board, player_one_marker, player_two_marker)
    @board = board
    @player_one_marker = player_one_marker
    @player_two_marker = player_two_marker
    @turn_count = 1
  end

  def submit_move(position, marker)
    @board.mark(position, marker)
    @turn_count += 1
  end

  def view_board
    @board.view
  end

  def current_player
    @turn_count % 2 == 0 ? @player_two_marker : @player_one_marker
  end
end