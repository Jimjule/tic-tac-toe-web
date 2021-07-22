require 'game'

describe Game do
  it 'Ends when a player wins' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move(1)
    game.submit_move(4)
    game.submit_move(2)
    game.submit_move(5)
    expect(game.ended?).to eq(false)
    game.submit_move(3)
    expect(game.victory?).to eq(true)
    expect(game.ended?).to eq(true)
  end

  it 'Does not mark the board once the game ends' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move(1)
    game.submit_move(4)
    game.submit_move(2)
    game.submit_move(5)
    game.submit_move(3)
    game.submit_move(6)
    expect(board.view).to eq(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9])
  end

  it 'Detects a draw' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move(1)
    game.submit_move(3)
    game.submit_move(2)
    game.submit_move(4)
    game.submit_move(5)
    game.submit_move(8)
    game.submit_move(6)
    game.submit_move(9)
    game.submit_move(7)
    expect(game.victory?).to eq(false)
  end

  it 'Ends the game when the board is full' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move(1)
    game.submit_move(3)
    game.submit_move(2)
    game.submit_move(4)
    game.submit_move(5)
    game.submit_move(8)
    game.submit_move(6)
    game.submit_move(9)
    game.submit_move(7)
    expect(game.ended?).to eq(true)
  end
end
