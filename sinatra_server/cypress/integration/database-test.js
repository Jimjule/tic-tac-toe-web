describe('MongoDB', () => {
  it('Returns number of games deleted', () => {
    cy.request('/delete_games')
    cy.request('/delete_games').its('body').should('eq', '0')
  })

  it('Returns number of saved games', () => {
    cy.request('/games_count').its('body').should('contain', '0')
  })

  it('Saves a game', () => {
    cy.request('/game_setup')
    cy.request('/add_game').its('body').should('eq', '1')
  })
})
