require 'game'

describe Game do
  it 'Can submit a move as the current player' do
    board = Game.create_board
    Game.submit_move(board, '1')
    expect(Game.submit_move(board, '9')).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 'O'])
    expect(Game.current_player(board)).to eq('X')
  end

  it 'Tracks the turn count' do
    board = Game.create_board
    expect(Game.turn_count(board)).to eq(1)
  end

  it 'Tracks changes in the turn count' do
    board = Game.create_board
    Game.submit_move(board, '1')
    Game.submit_move(board, '2')
    expect(Game.turn_count(board)).to eq(3)
  end

  it 'Tracks the current player' do
    board = Game.create_board
    expect(Game.current_player(board)).to eq('X')
  end

  it 'Tracks changes to the current player' do
    board = Game.create_board
    board = Game.submit_move(board, '1')
    expect(Game.current_player(board)).to eq('O')
  end

  it 'Knows that the game is not over' do
    board = Game.create_board
    turn_count = Game.turn_count(board)
    expect(Game.ended?(board)).to eq(false)
  end

  it 'Displays a split board' do
    board = Game.create_board
    expect(Game.format_board(board)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end
end
