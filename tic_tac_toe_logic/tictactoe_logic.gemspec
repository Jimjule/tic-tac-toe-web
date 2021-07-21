Gem::Specification.new do |spec|
  spec.name = 'tictactoe_logic'
  spec.version = '1.2.1'
  spec.summary = 'The logic for a TicTacToe game'
  spec.description = 'The logic for a TicTacToe game'
  spec.authors = ['Jules Roadknight']
  spec.email = 'roadknightj@gmail.com'
  spec.files = [
    './lib/board.rb', './lib/game.rb'
  ]
  spec.homepage = 'https://rubygems.org/gems/tictactoe_logic'
  spec.license = 'MIT'
  spec.add_development_dependency 'rspec', '~>3.9.0'
  spec.add_development_dependency 'rake', '~>13.0.1'
end
