import { createMachine } from 'xstate';

type ServerHealthEvents = 
| { type: 'HEALTHY' }
| { type: 'UNHEALTHY' }

type ServerHealthStates =
  | { value: 'Healthy'; context: ServerHealthContext }
  | { value: 'Unhealthy'; context: ServerHealthContext };

interface ServerHealthContext {
  connected: false
}

export const serverHealthCheckMachine = createMachine<
  ServerHealthContext,
  ServerHealthEvents,
  ServerHealthStates
>({
  id: 'health',
  initial: 'Unhealthy',
  context: undefined,
  states: {
    'Healthy': {
      on: { UNHEALTHY: 'Unhealthy' }
    },
    'Unhealthy': {
      on: { HEALTHY: 'Healthy', UNHEALTHY: 'Unhealthy' }
    }
  }
});
