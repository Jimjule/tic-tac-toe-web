import { useMachine } from '@xstate/react';
import React, { useState } from 'react';
import './App.css';
import Board from './components/Board';
import CurrentPlayer from './components/CurrentPlayer';
import GameResult from './components/GameResult';
import GameStatus from './components/GameStatus';
import ServerHealthCheck from './components/ServerHealthCheck';
import TestGames from './components/TestGames';
import { gameResultMachine } from './machines/gameResultMachine';
import { gameStatusMachine } from './machines/gameStatusMachine';

interface GameJSON {
  board: (string | number)[][],
  player: string
  game_over: boolean
  victory: boolean
  current_player: string
}

function App() {
  const defaultBoard = [['-', 0, '-'], [0, '-', 0], ['-', 0, '-']]
  const [currentGameStatus, sendGameStatus] = useMachine(gameStatusMachine);
  const [currentGameResult, sendGameResult] = useMachine(gameResultMachine);
  const [currentBoard, setBoard] = useState(defaultBoard)

  function startGame(data: { board: React.SetStateAction<(string | number)[][]>; }) {
    sendGameStatus('START')
    setBoard(data.board)
  }

  function mainMenu() {
    sendGameStatus('MENU')
    setBoard(defaultBoard)
  }

  function newGame() {
    fetch(`http://localhost:4567/game_setup`)
      .then(response => response.json())
      .then(data => startGame(data))
  }

  function makeMove() {
    let playerMove = 1
    const requestOptions = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ 'player_move': playerMove })
    }
    fetch(`http://localhost:4567/make_move`, requestOptions)
      .then(response => response.json())
      .then(data => console.log(data))
  }

  function getUpdate(data: GameJSON) {
    console.log(data)
    setBoard(data.board)
    if(currentGameStatus.value === 'Not Started') {
      sendGameStatus('START')
    }
    if(data.game_over) {
      sendGameStatus('FINISH')
      gameResult(data.victory, data.current_player)
    }
  }

  function gameResult(victory: boolean, player: string) {
    console.log(victory)
    console.log(player);
    
    if (victory && player === "O") return sendGameResult('OWIN')
    if (victory && player === "X") return sendGameResult('XWIN')
    if (!victory) return sendGameResult('DRAW')
    return console.error('End result problem - No winner and no draw')
  }

  return (
    <div className="App">
      <h1 className="welcome-header">Welcome to Tic-Tac-Toe 4 - The Re-web-ening</h1>
      <ServerHealthCheck />
      <GameStatus status={currentGameStatus.value} />

      {currentGameStatus.value === 'Not Started' && 
        <TestGames onSend={getUpdate} />
      }
      {currentGameStatus.value === 'In Progress' && 
        <div className='game-in-progress'>
          <CurrentPlayer />
          <button className='make-move-button' onClick={() => console.log('Move made')}>Make Move</button>
          <button className='main-menu-button' onClick={mainMenu}>Main Menu</button>
        </div>
      }
      {currentGameStatus.value === 'Game Over' && 
        <div className='game-over'>
          <GameResult gameResult={currentGameResult.value} />
          <button className='main-menu-button' onClick={mainMenu}>Main Menu</button>
        </div>
      }

      <Board boardState={currentBoard} />
      <button className='new-game-button' onClick={newGame}>New Game</button>
    </div>
  );
}

export default App;
