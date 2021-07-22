import { mount } from '@cypress/react';
import CurrentPlayer from '../../components/CurrentPlayer';

describe('Change current player', () => {
  it('Changes player on click', () => {
    mount(<CurrentPlayer />)
    cy.get('.change-player').should('be.visible')
    cy.contains('.current-player', 'Current Player: 1')
    cy.get('.change-player').click()
    cy.contains('.current-player', 'Current Player: 2')
  })
})
