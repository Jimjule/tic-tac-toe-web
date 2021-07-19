class Board 
  def initialize(board_length)
    @board_length = board_length
    @board = populate(board_length)
  end

  def view
    @board
  end

  private
  
  def populate(board_length)
    board = []
    iterator = 0
    (board_length * board_length).times do
      iterator += 1
      board.push iterator
    end
    board
  end
end