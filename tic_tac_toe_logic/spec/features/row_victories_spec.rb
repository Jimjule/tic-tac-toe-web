require 'board'

describe Board do
  it 'Can detect no row victory for a single move' do
    board_size = 3
    board = Game.create_board(3)
    Board.mark(board, 1, 'X')
    expect(Board.check_victory(board, 'X')).to eq(false)
  end

  it 'Can detect no row victory for a mixed line' do
    board_size = 3
    board = Game.create_board(board_size)

    Board.mark(board, 1, 'X')
    Board.mark(board, 2, 'O')
    Board.mark(board, 3, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)
    expect(Board.check_victory(board, 'O')).to eq(false)
  end

  it 'Can detect a row victory' do
    board_size = 3
    board = Game.create_board(board_size)

    Board.mark(board, 1, 'X')
    Board.mark(board, '2', 'X')
    Board.mark(board, '4', 'O')
    Board.mark(board, 3, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end

  it 'Can detect a victory in the third row' do
    board_size = 3
    board = Game.create_board(board_size)
    
    Board.mark(board, 9, 'X')
    Board.mark(board, 8, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)

    Board.mark(board, 7, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end

  it 'Can detect a row victory on a 4x4 board' do
    board_size = 4
    board = Game.create_board(board_size)

    Board.mark(board, 1, 'Y')
    Board.mark(board, '2', 'Y')
    Board.mark(board, 3, 'Y')

    expect(Board.check_victory(board, 'Y')).to eq(false)

    Board.mark(board, 4, 'Y')

    expect(Board.check_victory(board, 'Y')).to eq(true)
  end
end