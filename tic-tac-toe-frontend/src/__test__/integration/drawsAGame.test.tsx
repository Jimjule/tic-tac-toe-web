import { mount } from '@cypress/react';
import App from '../../App';

describe('<Finishing a game>', () => {
  it('Draws a game', () => {
    mount(<App />)
    cy.get('.welcome-header').should('be.visible')
    cy.get('.server-health', { timeout: 10000 }).should('contain', 'Server Health: Healthy')
    cy.get('.test-game-draw').click()

    cy.get('.game-progress').should('contain', 'Game Status: Game Over')
    cy.get('.game-result').should('contain', 'DRAW')

    cy.get('.main-menu-button').click()
    cy.get('.game-progress').should('contain', 'Game Status: Not Started')
  })
})
