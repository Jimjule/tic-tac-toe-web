describe('Testing the Server', () => {
  it('Checks the system health', () => {
    cy.request('/health_check').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.health).to.eq('System Health: true')
      expect(response).to.have.property('headers')
    })
  })

  it('Can make a POST test', () => {
    cy.request('/game_setup')
    cy.request('POST', '/make_move', {'playerMove': 1}).then((response) => {
      expect(response.status).to.eq(200)
    })
  })

  it('Can execute a Worker task', () => {
    cy.request('/sidekiq_test?echo=test-echo').its('body').should('eq', 'test-echo')
  })
})
