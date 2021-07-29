import Board from '../components/Board';
import CurrentPlayer from '../components/CurrentPlayer';
import GameStatus from '../components/GameStatus';
import ServerHealthCheck from '../components/ServerHealthCheck';
import TestGames from '../components/TestGames';

interface TictactoeProps {
  gameStatus: String
  onSend: Function
}

const Tictactoe: React.FC<TictactoeProps> = ({gameStatus, onSend}) => {
  return(
    <div>
      {/* Tictactoe
      <ServerHealthCheck />
      <CurrentPlayer />
      <GameStatus status={gameStatus} onSend={onSend} />
      <Board />
      <TestGames /> */}
    </div>
  )
}

export default Tictactoe;