import { useMachine } from '@xstate/react';
import { gameStatusMachine } from '../machines/gameStatusMachine';

const GameStatus = () => {
  const [current, send] = useMachine(gameStatusMachine);
  return(
    <div>
      <div className="game-progress">Game Status: {current.value}</div>
    </div>
  )
}

export default GameStatus;
