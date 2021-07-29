require 'board'

describe Board do
  it 'Can mark the board' do
    board = Game.create_board
    Board.mark(board, 1, 'X')
    expect(board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'Can check for victory' do
    board = Game.create_board
    current_player = Game.current_player(board)
    expect(Board.check_victory(board, current_player)).to eq(false)
  end
end