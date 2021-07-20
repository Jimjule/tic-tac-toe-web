class Board 
  def initialize(board_length)
    @board_length = board_length
    @board_state = create_board(board_length)
  end

  def view
    @board_state
  end

  def mark(position, marker)
    @board_state[position.to_i - 1] = marker
  end

  def check_victory(marker)
    check_row_loop(marker) || check_column_loop(marker) || check_diagonal(marker)
  end

  def size
    @board_length * @board_length
  end

  private

  def create_board(board_length)
    board = []
    iterator = 0
    (board_length * board_length).times do
      iterator += 1
      board.push iterator
    end
    board
  end

  def check_row_loop(marker)
    result = false
    board_rows = @board_state.each_slice(@board_length).to_a
    0.upto(@board_length - 1) { |i| result = true if check_slice(marker, board_rows[i]) }
    result
  end

  def check_column_loop(marker)
    result = false
    board_columns = view.group_by.with_index{|_, k| k % @board_length}.values
    0.upto(@board_length - 1) { |l| result = true if check_slice(marker, board_columns[l]) }
    result
  end

  def check_slice(marker, row)
    matches = 0
    0.upto(@board_length - 1) { |j| matches += 1 if row[j] == marker }
    matches == @board_length
  end

  def check_diagonal(marker)
    @board_length == 3 && view[0] == marker && view[4] == marker && view[8] == marker||
    @board_length == 3 && view[2] == marker && view[4] == marker && view[6] == marker ?
    true : false
  end
end