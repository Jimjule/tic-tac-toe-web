describe('Testing the Server', () => {
  it('Checks the system health', () => {
    cy.request('localhost:4567/health_check').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.health).to.eq('System Health: true')
      expect(response).to.have.property('headers')
    })
  })

  it('Can make a POST test', () => {
    cy.request('localhost:4567/game_setup')
    cy.request('POST', 'localhost:4567/make_move', {'playerMove': 1}).then((response) => {
      expect(response.status).to.eq(200)
    })
  })
})
