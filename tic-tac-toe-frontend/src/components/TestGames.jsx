const TestGames = ({onSend}) => {
  function testGameXWin() {
    let playerMove = 1
    fetch(`http://localhost:4567/test_game_x_wins?player_move=${playerMove}`)
      .then(response => response.json())
      .then(data => onSend(data))
  }

  function testGameOWin() {
    let playerMove = 1
    fetch(`http://localhost:4567/test_game_o_wins?player_move=${playerMove}`)
      .then(response => response.json())
      .then(data => onSend(data))
  }

  function testGameDraw() {
    let playerMove = 7
    fetch(`http://localhost:4567/test_game_draw?player_move=${playerMove}`)
      .then(response => response.json())
      .then(data => onSend(data))
  }

  return(
    <div className="test-games">
      <button className="test-game-x-win" onClick={testGameXWin}>Test Game (X Wins)</button>
      <button className="test-game-o-win" onClick={testGameOWin}>Test Game (O Wins)</button>
      <button className="test-game-draw" onClick={testGameDraw}>Test Game (Draw)</button>
    </div>
  )
}

export default TestGames;
