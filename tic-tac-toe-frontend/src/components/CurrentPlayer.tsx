import { useMachine } from '@xstate/react';
import { currentPlayerMachine } from '../machines/currentPlayerMachine';

const CurrentPlayer = () => {
  const [current, send] = useMachine(currentPlayerMachine);
  return(
    <div>
      <div className="current-player">Current Player: {current.value}</div>
    </div>
  )
}

export default CurrentPlayer;
