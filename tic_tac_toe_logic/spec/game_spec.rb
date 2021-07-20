require 'game'

describe Game do
  it 'Can submit a move' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move('1', 'X')
    expect(game.view_board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
  end
end