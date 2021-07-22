import { mount } from '@cypress/react';
import ServerHealthCheck from '../../components/ServerHealthCheck'

describe('Testing Server Health', () => {
  it('Should be healthy', () => {
    mount(<ServerHealthCheck />)
    cy.get('.server-health').should('be.visible')
    cy.contains('.server-health', 'Server Health: Healthy')
  })
})
