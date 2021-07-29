import { mount } from '@cypress/react';
import CurrentPlayer from '../../components/CurrentPlayer';

describe('Change current player', () => {
  it('Changes player on click', () => {
    mount(<CurrentPlayer />)
    cy.contains('.current-player', 'Current Player: 1')
  })
})
