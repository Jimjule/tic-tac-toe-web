require 'board'

describe Board do
  it 'Can detect no row victory for a single move' do
    board = Board.new(3)
    board.mark(1, 'X')
    expect(board.check_victory('X')).to eq(false)
  end

  it 'Can detect no row victory for a mixed line' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark(2, 'O')
    board.mark(3, 'X')

    expect(board.check_victory('X')).to eq(false)
    expect(board.check_victory('O')).to eq(false)
  end

  it 'Can detect a row victory' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark('2', 'X')
    board.mark(3, 'X')

    expect(board.check_victory('X')).to eq(true)
  end

  it 'Can detect a victory in the third row' do
    board = Board.new(3)
    
    board.mark(9, 'X')
    board.mark(8, 'X')

    expect(board.check_victory('X')).to eq(false)

    board.mark(7, 'X')

    expect(board.check_victory('X')).to eq(true)
  end

  it 'Can detect a row victory on a 4x4 board' do
    board = Board.new(4)

    board.mark(1, 'Y')
    board.mark('2', 'Y')
    board.mark(3, 'Y')

    expect(board.check_victory('Y')).to eq(false)

    board.mark(4, 'Y')

    expect(board.check_victory('Y')).to eq(true)
  end
end