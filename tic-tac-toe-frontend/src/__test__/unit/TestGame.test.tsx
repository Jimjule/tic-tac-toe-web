import { mount } from '@cypress/react';
import TestGames from '../../components/TestGames';

describe('<TestGames />', () => {
  it('Displays correctly', () => {
    mount(<TestGames onSend={() => {}} />)
    cy.get('.test-game-x-win').should('be.visible')
    cy.get('.test-game-o-win').should('be.visible')
    cy.get('.test-game-draw').should('be.visible')
  })
});
