require 'board'

describe Board do
  it 'Can detect no column victory for a single move' do
    board = Board.new(3)
    board.mark(1, 'X')
    expect(board.check_victory('X')).to eq(false)
  end

  it 'Can detect no row victory for a mixed line' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark(4, 'O')
    board.mark(7, 'X')

    expect(board.check_victory('X')).to eq(false)
    expect(board.check_victory('O')).to eq(false)
  end

  it 'Can detect a column victory' do
    board = Board.new(3)

    board.mark(1, 'X')
    board.mark('4', 'X')
    board.mark(7, 'X')

    expect(board.check_victory('X')).to eq(true)
  end

  it 'Can detect a victory in the second column' do
    board = Board.new(3)
    
    board.mark(2, 'X')
    board.mark(8, 'X')

    expect(board.check_victory('X')).to eq(false)

    board.mark(5, 'X')

    expect(board.check_victory('X')).to eq(true)
  end

  it 'Can detect a column victory on a 4x4 board' do
    board = Board.new(4)

    board.mark(1, 'Y')
    board.mark('5', 'Y')
    board.mark(9, 'Y')

    expect(board.check_victory('Y')).to eq(false)

    board.mark(13, 'Y')

    expect(board.check_victory('Y')).to eq(true)
  end
end