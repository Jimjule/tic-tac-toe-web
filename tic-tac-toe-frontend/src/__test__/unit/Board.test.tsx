import { render } from '@testing-library/react';
import Board from '../../components/Board';

describe('<Board />', () => {
  it('Displays correctly', () => {
    render(<Board boardState={[[1, 2, 3], [4, 5, 6], [7, 8, 9]]} />);
    cy.get('.board').should('be.visible')
    cy.get('.board-title').should('contain', 'Board')
    
    cy.get('.board-row-1').should('contain', '123')
    cy.get('.board-row-2').should('contain', '456')
    cy.get('.board-row-3').should('contain', '789')
  })
});
