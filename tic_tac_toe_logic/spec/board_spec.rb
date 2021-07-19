require 'board'

describe Board do
  it 'Can view the board' do
    board = Board.new(3)
    expect(board.view).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end