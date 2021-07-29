import { useMachine } from '@xstate/react';
import { useEffect } from 'react';
import { StateValue } from 'xstate';
import { gameStatusMachine } from '../machines/gameStatusMachine';

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
