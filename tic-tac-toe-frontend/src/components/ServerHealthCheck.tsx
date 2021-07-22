import { useMachine } from '@xstate/react';
import { useEffect } from 'react';
import { serverHealthCheckMachine } from '../machines/serverHealthCheckMachine';

const GameStatus = () => {
  const [current, send] = useMachine(serverHealthCheckMachine);

  useEffect(() => {
    const checkHealth = () => {
      fetch(`http://localhost:4567/health_check`)
      .then(response => response.json())
      .then(data => data.health === 'System Health: true' ? send('HEALTHY') : send('UNHEALTHY') )
    }
    try {
      checkHealth()
    } catch (error) {
      console.error(error)
      send('UNHEALTHY')
    }
  })

  return(
    <div>
      <div className="server-health">Server Health: {current.value}</div>
    </div>
  )
}

export default GameStatus;
