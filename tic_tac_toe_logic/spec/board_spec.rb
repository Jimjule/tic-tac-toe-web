require 'board'

describe Board do
  it 'Can view the board' do
    board = Board.new(3)
    expect(board.view).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'Can mark the board' do
    board = Board.new(3)
    board.mark(1, 'X')
    expect(board.view).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'Can check for victory' do
    board = Board.new(3)
    expect(board.check_victory('X')).to eq(false)
  end
end