class Game
  attr_reader :board, :turn_count
  def initialize(board, player_one_marker, player_two_marker)
    @board = board
    @player_one_marker = player_one_marker
    @player_two_marker = player_two_marker
    @turn_count = 1
  end

  def submit_move(position)
    @board.mark(position, current_player) if !ended?
    @turn_count += 1 if !ended?
  end

  def view_board
    @board.view
  end

  def format_board
    @board.view.each_slice(board.board_length).to_a
  end

  def current_player
    @turn_count % 2 == 0 ? @player_two_marker : @player_one_marker
  end

  def ended?
    victory? || @turn_count >= board.size
  end

  def victory?
    @board.check_victory(current_player)
  end
end