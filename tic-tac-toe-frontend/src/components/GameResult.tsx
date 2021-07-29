import { useMachine } from '@xstate/react';
import { StateValue } from 'xstate';
import { currentPlayerMachine } from '../machines/currentPlayerMachine';

interface GameResultProps {
  gameResult: StateValue
}

const GameResult: React.FC<GameResultProps> = ({gameResult}) => {
  const [current, send] = useMachine(currentPlayerMachine);
  return(
    <div>
      <div className="game-result">{gameResult}</div>
    </div>
  )
}

export default GameResult;
