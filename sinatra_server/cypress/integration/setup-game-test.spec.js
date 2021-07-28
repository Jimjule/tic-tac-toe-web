describe('Playing a game', () => {
  it('Checks the system health', () => {
    cy.request('localhost:4567/health_check').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.health).to.eq('System Health: true')
      expect(response).to.have.property('headers')
    })
  })

  it('Views board', () => {
    cy.request('localhost:4567/game_setup')
    cy.request('localhost:4567/view_board').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.board).to.deep.eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    })
  })

  it('Can make a move', () => {
    cy.request('/game_setup')
    cy.request('POST', '/make_move', {'playerMove': 5}).then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.board).to.deep.eq([[1, 2, 3], [4, 'X', 6], [7, 8, 9]])
      expect(response.body.game_over).to.eq(false)
      expect(response.body.victory).to.eq(false)
      expect(response.body.current_player).to.eq('O')
    })
  })

  it('Wins a game as X', () => {
    cy.request('localhost:4567/game_setup')
    cy.request('POST', '/make_move', {'playerMove': 1})
    cy.request('POST', '/make_move', {'playerMove': 4})
    cy.request('POST', '/make_move', {'playerMove': 2})
    cy.request('POST', '/make_move', {'playerMove': 5})
    cy.request('POST', '/make_move', {'playerMove': 3}).then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.board).to.deep.eq([['X', 'X', 'X'], ['O', 'O', 6], [7, 8, 9]])
      expect(response.body.game_over).to.eq(true)
      expect(response.body.victory).to.eq(true)
      expect(response.body.current_player).to.eq('X')
    })

    it('Wins a game as X with GET requests', () => {
      cy.request('localhost:4567/game_setup')
      cy.request('GET', '/make_move?player_move=1')
      cy.request('GET', '/make_move?player_move=4')
      cy.request('GET', '/make_move?player_move=2')
      cy.request('GET', '/make_move?player_move=5')
      cy.request('GET', '/make_move?player_move=3').then((response) => {
        expect(response.status).to.eq(200)
        expect(response.body.board).to.deep.eq([['X', 'X', 'X'], ['O', 'O', 6], [7, 8, 9]])
        expect(response.body.game_over).to.eq(true)
        expect(response.body.victory).to.eq(true)
        expect(response.body.current_player).to.eq('X')
      })
    })
  })
})
