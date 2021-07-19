Gem::Specification.new do |spec|
  spec.name = 'tictactoe_logic'
  spec.version = '0.0.1'
  spec.summary = 'The logic for a TicTacToe game'
  spec.description = 'The logic for a TicTacToe game'
  spec.authors = ['Jules Roadknight']
  spec.email = 'roadknightj@gmail.com'
  spec.files = [
    './lib/board.rb', './spec/board_spec.rb', 
  ]
  spec.homepage = 'https://rubygems.org/gems/tictactoe_logic'
  spec.license = 'MIT'
  spec.add_development_dependency 'rspec', '~>3.9.0'
  spec.add_development_dependency 'rake', '~>13.0.1'
end
