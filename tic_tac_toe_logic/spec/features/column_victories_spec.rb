require 'board'

describe Board do
  it 'Can detect no column victory for a single move' do
    board = Game.create_board
    Board.mark(board, 1, 'X')
    expect(Board.check_victory(board, 'X')).to eq(false)
  end

  it 'Can detect no row victory for a mixed line' do
    board = Game.create_board

    Board.mark(board, 1, 'X')
    Board.mark(board, 4, 'O')
    Board.mark(board, 7, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)
    expect(Board.check_victory(board, 'O')).to eq(false)
  end

  it 'Can detect a column victory' do
    board = Game.create_board

    Board.mark(board, 1, 'X')
    Board.mark(board, '4', 'X')
    Board.mark(board, 7, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end

  it 'Can detect a victory in the second column' do
    board = Game.create_board
    
    Board.mark(board, 2, 'X')
    Board.mark(board, 8, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)

    Board.mark(board, 5, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end

  it 'Can detect a column victory on a 4x4 board' do
    board = Game.create_board(4)

    Board.mark(board, 1, 'Y')
    Board.mark(board, '5', 'Y')
    Board.mark(board, 9, 'Y')

    expect(Board.check_victory(board, 'Y')).to eq(false)

    Board.mark(board, 13, 'Y')

    expect(Board.check_victory(board, 'Y')).to eq(true)
  end
end