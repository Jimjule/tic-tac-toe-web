describe('Tic-tac-toe Web', () => {
  beforeEach(() => {
    cy.visit('localhost:3000')
  })

  it('Displays the welcome header', () => {
    cy.get('.welcome-header').should('be.visible')
  })
})
