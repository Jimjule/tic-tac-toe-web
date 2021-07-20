require 'game'

describe Game do
  it 'Can submit a move as the current player' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move('1')
    game.submit_move('9')
    expect(game.view_board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 'O'])
  end

  it 'Tracks the turn count' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    expect(game.turn_count).to eq(1)
  end

  it 'Tracks changes in the turn count' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move('1')
    game.submit_move('2')
    expect(game.turn_count).to eq(3)
  end

  it 'Tracks the current player' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    expect(game.current_player).to eq('X')
  end

  it 'Tracks changes to the current player' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    game.submit_move('1')
    expect(game.current_player).to eq('O')
  end

  it 'Knows that the game is not over' do
    board = Board.new(3)
    game = Game.new(board, 'X', 'O')
    expect(game.ended?).to eq(false)
  end

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