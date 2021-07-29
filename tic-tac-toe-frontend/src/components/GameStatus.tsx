import { StateValue } from 'xstate';

interface GameStatusProps {
  status: StateValue
}

const GameStatus: React.FC<GameStatusProps> = ({status}) => {
  return(
    <div>
      <div className="game-progress">Game Status: {status}</div>
    </div>
  )
}

export default GameStatus;
