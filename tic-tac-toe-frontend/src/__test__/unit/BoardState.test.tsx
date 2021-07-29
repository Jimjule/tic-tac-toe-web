import { mount } from '@cypress/react';
import Board from '../../components/Board';

describe('The Game Board', () => {
  it('', () => {
    mount(<Board boardState={[[1, 2, 3], [4, 5, 6], [7, 8, 9]]} />)
    cy.get('.board').should('be.visible')
    cy.contains('.board-row-1', '123')
    cy.contains('.board-row-2', '456')
    cy.contains('.board-row-3', '789')
  })
})
