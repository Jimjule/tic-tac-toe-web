require 'board'

describe Board do
  it 'Can detect no diagonal victory for a single move' do
    board = Game.create_board
    Board.mark(board, 1, 'X')
    expect(Board.check_victory(board, 'X')).to eq(false)
  end

  it 'Can detect no diagonal victory for a mixed line' do
    board = Game.create_board

    Board.mark(board, 1, 'X')
    Board.mark(board, 5, 'O')
    Board.mark(board, 9, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)
    expect(Board.check_victory(board, 'O')).to eq(false)
  end

  it 'Can detect a falling diagonal victory' do
    board = Game.create_board

    Board.mark(board, 1, 'X')
    Board.mark(board, '5', 'X')
    Board.mark(board, 9, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end

  it 'Can detect a rising diagonal victory' do
    board = Game.create_board
    
    Board.mark(board, 3, 'X')
    Board.mark(board, 5, 'X')

    expect(Board.check_victory(board, 'X')).to eq(false)

    Board.mark(board, 7, 'X')

    expect(Board.check_victory(board, 'X')).to eq(true)
  end
end