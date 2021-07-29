import { mount } from '@cypress/react';
import React from 'react';
import App from '../../App';
import GameStatus from '../../components/GameStatus';

describe('Tracks game progress', () => {
  it('Starts with `In Progress`', () => {
    mount(<App />)
    cy.get('.game-progress').should('be.visible')
    cy.contains('.game-progress', 'Not Started')
  })
})
