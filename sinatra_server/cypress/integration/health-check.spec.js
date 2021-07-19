describe('Cypress server', () => {
  it('Checks the system health', () => {
    cy.request('localhost:4567/health-check').then((response ) => {
      expect(response.status).to.eq(200);
      expect(response.body.health).to.eq('System Health: true');
      expect(response).to.have.property('headers');
    })
  })
})
