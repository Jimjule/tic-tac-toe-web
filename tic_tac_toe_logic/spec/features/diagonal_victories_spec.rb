require 'board'

describe Board do
  it 'Can detect no diagonal victory for a single move' do
    board = Board.new(3)
    board.mark(1, 'X')
    expect(board.check_victory('X')).to eq(false)
  end

  it 'Can detect no diagonal victory for a mixed line' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark(5, 'O')
    board.mark(9, 'X')

    expect(board.check_victory('X')).to eq(false)
    expect(board.check_victory('O')).to eq(false)
  end

  it 'Can detect a falling diagonal victory' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark('5', 'X')
    board.mark(9, 'X')

    expect(board.check_victory('X')).to eq(true)
  end

  it 'Can detect a rising diagonal victory' do
    board = Board.new(3)
    
    board.mark(3, 'X')
    board.mark(5, 'X')

    expect(board.check_victory('X')).to eq(false)

    board.mark(7, 'X')

    expect(board.check_victory('X')).to eq(true)
  end
end