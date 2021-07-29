import { mount } from '@cypress/react';
import App from '../../App';

describe('<App />', () => {
  it('Starting a game', () => {
    mount(<App />);
    cy.get('.welcome-header').should('be.visible')
    cy.get('.test-games').should('be.visible')
    cy.get('.game-progress').should('contain', 'Game Status: Not Started')
    cy.get('.board-row-1').should('contain', '-0-')
    cy.get('.game-in-progress').should('not.exist')

    cy.get('.new-game-button').click()
    
    cy.get('.game-progress').should('contain', 'Game Status: In Progress')
    cy.get('.board-row-1').should('contain', '123')
    cy.get('.board-row-2').should('contain', '456')
    cy.get('.board-row-3').should('contain', '789')
    cy.get('.game-in-progress').should('be.visible')

    cy.get('.main-menu-button').click()
    cy.get('.game-progress').should('contain', 'Game Status: Not Started')
    cy.get('.board-row-1').should('contain', '-0-')
    cy.get('.game-in-progress').should('not.exist')
  })
});
