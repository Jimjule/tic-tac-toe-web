import { createMachine } from 'xstate';

type CurrentPlayerEvents = { type: 'SWITCH' }

type CurrentPlayerStates =
  | { value: '1'; context: CurrentPlayerContext }
  | { value: '2'; context: CurrentPlayerContext };

interface CurrentPlayerContext {
  turns: 0
}

export const currentPlayerMachine = createMachine<
  CurrentPlayerContext,
  CurrentPlayerEvents,
  CurrentPlayerStates
>({
  id: 'player',
  initial: '1',
  context: undefined,
  states: {
    1: {
      on: { SWITCH: '2' }
    },
    2: {
      on: { SWITCH: '1' }
    }
  }
});
