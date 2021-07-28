require 'game'

describe Game do
  it 'Ends when a player wins' do
    board = Game.create_board
    Game.submit_move(board, 1)
    Game.submit_move(board, 4)
    Game.submit_move(board, 2)
    Game.submit_move(board, 5)
    expect(Game.ended?(board)).to eq(false)
    Game.submit_move(board, 3)
    expect(Game.victory?(board)).to eq(true)
    expect(Game.ended?(board)).to eq(true)
  end

  it 'Does not mark the board once the game ends' do
    board = Game.create_board
    Game.submit_move(board, 1)
    Game.submit_move(board, 4)
    Game.submit_move(board, 2)
    Game.submit_move(board, 5)
    Game.submit_move(board, 3)
    Game.submit_move(board, 6)
    expect(board).to eq(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9])
  end

  it 'Detects a draw' do
    board = Game.create_board
    Game.submit_move(board, 1)
    Game.submit_move(board, 3)
    Game.submit_move(board, 2)
    Game.submit_move(board, 4)
    Game.submit_move(board, 5)
    Game.submit_move(board, 8)
    Game.submit_move(board, 6)
    Game.submit_move(board, 9)
    Game.submit_move(board, 7)
    expect(Game.victory?(board)).to eq(false)
  end

  it 'Ends the game when the board is full' do
    board = Game.create_board
    Game.submit_move(board, 1)
    Game.submit_move(board, 3)
    Game.submit_move(board, 2)
    Game.submit_move(board, 4)
    Game.submit_move(board, 5)
    Game.submit_move(board, 8)
    Game.submit_move(board, 6)
    Game.submit_move(board, 9)
    Game.submit_move(board, 7)
    expect(Game.ended?(board)).to eq(true)
  end
end
