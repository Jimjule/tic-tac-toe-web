import { createMachine } from 'xstate';

type GameStatusEvents = 
| { type: 'FINISH' }
| { type: 'START' }
| { type: 'MENU' }

type GameStatusStates =
  | { value: 'Not Started'; context: GameStatusContext}
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
  id: 'status',
  initial: 'Not Started',
  context: undefined,
  states: {
    'Not Started': {
      on: {
        START: 'In Progress'
      }
    },
    'In Progress': {
      on: {
        FINISH: 'Game Over',
        MENU: 'Not Started'
      },
    },
    'Game Over': {
      on: {
        START: 'In Progress',
        MENU: 'Not Started'
      }
    }
  }
});
