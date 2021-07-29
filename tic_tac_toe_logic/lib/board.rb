class Board
  def self.mark(board_state, position, marker)
    board_state[position.to_i - 1] = marker
    board_state
  end

  def self.check_victory(board_state, marker)
    board_size = Math.sqrt(board_state.length)
    check_row_loop(board_state, marker, board_size) || check_column_loop(board_state, marker, board_size) || check_diagonal(board_state, marker, board_size)
  end

  private

  def self.check_row_loop(board, marker, board_size)
    result = false
    board_rows = board.each_slice(board_size).to_a
    0.upto(board_size - 1) { |i| result = true if check_slice(marker, board_rows[i], board_size) }
    result
  end

  def self.check_column_loop(board, marker, board_size)
    result = false
    board_columns = board.group_by.with_index{|_, k| k % board_size}.values
    0.upto(board_size - 1) { |l| result = true if check_slice(marker, board_columns[l], board_size) }
    result
  end

  def self.check_slice(marker, row, board_size)
    matches = 0
    0.upto(board_size - 1) { |j| matches += 1 if row[j] == marker }
    matches == board_size
  end

  def self.check_diagonal(board, marker, board_size)
    board_size == 3 && board[0] == marker && board[4] == marker && board[8] == marker||
    board_size == 3 && board[2] == marker && board[4] == marker && board[6] == marker ?
    true : false
  end
end