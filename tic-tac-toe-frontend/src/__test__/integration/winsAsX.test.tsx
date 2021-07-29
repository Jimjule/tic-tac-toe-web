import { mount } from '@cypress/react';
import App from '../../App';

describe('<Finishing a game>', () => {
  it('Wins as X', () => {
    mount(<App />)
    cy.get('.server-health', { timeout: 10000 }).should('contain', 'Server Health: Healthy')
    cy.get('.test-game-x-win').click()

    cy.get('.board-row-1').should('contain', 'XXX')
    cy.get('.board-row-2').should('contain', '4OO')
    cy.get('.board-row-3').should('contain', '789')
    cy.get('.game-progress').should('contain', 'Game Status: Game Over')
    cy.get('.game-result').should('contain', 'X is the Winner!')

    cy.get('.main-menu-button').click()
  })
})
