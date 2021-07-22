import { render } from '@testing-library/react';
import App from '../../App';

describe('<App />', () => {
  it('Displays `Welcome`', () => {
    render(<App />);
    cy.get('.welcome-header').should('be.visible')
  })
});
