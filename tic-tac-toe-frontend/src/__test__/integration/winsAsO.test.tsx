import { mount } from '@cypress/react';
import App from '../../App';

describe('<Finishing a game>', () => {
  it('Winning a game as O', () => {
    mount(<App />)
    cy.get('.welcome-header').should('be.visible')
    cy.get('.game-progress').should('contain', 'Game Status: Not Started')

    cy.get('.server-health', { timeout: 10000 }).should('contain', 'Server Health: Healthy')
    cy.get('.test-game-o-win').click()

    cy.get('.game-progress').should('contain', 'Game Status: Game Over')
    cy.get('.game-result').should('contain', 'O is the Winner!')

    cy.get('.main-menu-button').click()
    cy.get('.game-progress').should('contain', 'Game Status: Not Started')
  })
})
