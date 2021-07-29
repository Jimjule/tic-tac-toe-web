import { createMachine } from 'xstate';

type GameResultEvents = 
| { type: 'RESET' }
| { type: 'XWIN' }
| { type: 'OWIN' }
| { type: 'DRAW' }

type GameResultStates =
  | { value: 'Undecided'; context: GameResultContext}
  | { value: 'X is the Winner!'; context: GameResultContext}
  | { value: 'O is the Winner!'; context: GameResultContext }
  | { value: 'DRAW'; context: GameResultContext };

interface GameResultContext {
  gameOver: true
}

export const gameResultMachine = createMachine<
  GameResultContext,
  GameResultEvents,
  GameResultStates
>({
  id: 'result',
  initial: 'Undecided',
  context: undefined,
  states: {
    'Undecided': {
      on: {
        XWIN: 'X is the Winner!',
        OWIN: 'O is the Winner!',
        DRAW: 'DRAW'
      }
    },
    'X is the Winner!': {
      on: {
        RESET: 'Undecided'
      },
    },
    'O is the Winner!': {
      on: {
        RESET: 'Undecided'
      }
    },
    'DRAW': {
      on: {
        RESET: 'Undecided'
      }
    }
  }
});
