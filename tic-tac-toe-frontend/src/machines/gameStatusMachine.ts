import { createMachine } from 'xstate';

type GameStatusEvents = 
| { type: 'FINISH' }
| { type: 'RESTART' }

type GameStatusStates =
  | { value: 'In Progress'; context: GameStatusContext }
  | { value: 'Game Over'; context: GameStatusContext };

interface GameStatusContext {
  gameOver: false
}

export const gameStatusMachine = createMachine<
  GameStatusContext,
  GameStatusEvents,
  GameStatusStates
>({
  id: 'player',
  initial: 'In Progress',
  context: undefined,
  states: {
    'In Progress': {
      on: { FINISH: 'Game Over' }
    },
    'Game Over': {
      on: { RESTART: 'In Progress' }
    }
  }
});
