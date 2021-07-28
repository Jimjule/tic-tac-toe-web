class Game
  def self.create_board(board_length = 3)
    board = []
    iterator = 0
    (board_length * board_length).times do
      iterator += 1
      board.push iterator
    end
    board
  end
  
  def self.submit_move(board, position)
    Board.mark(board, position, self.current_player(board)) if !self.ended?(board)
  end

  def self.format_board(board, board_size = 3)
    board.each_slice(3).to_a
  end

  def self.turn_count(board)
    turns = 1 + board.count('X')+ board.count('O')
  end

  def self.current_player(board)
    self.turn_count(board) % 2 == 0 ? 'O' : 'X'
  end

  def self.last_player(board)
    self.turn_count(board) % 2 == 0 ? 'X' : 'O'
  end

  def self.ended?(board)
    self.victory?(board) || self.turn_count(board) >= board.length
  end

  def self.victory?(board)
    Board.check_victory(board, self.last_player(board))
  end
end