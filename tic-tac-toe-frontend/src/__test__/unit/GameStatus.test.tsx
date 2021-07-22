import { mount } from '@cypress/react';
import GameStatus from '../../components/GameStatus';

describe('Tracks game progress', () => {
  it('Starts with `In Progress`', () => {
    mount(<GameStatus />)
    cy.get('.game-progress').should('be.visible')
    cy.contains('.game-progress', 'In Progress')
  })
})
