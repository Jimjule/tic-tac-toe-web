## Approach

The early focus on this project was getting a walking skeleton going, with the frontend app, the server, and the database communicating. With this in mind, a Ruby Gem containing the game logic and a Sinatra server with a couple of routes were prioritised. The React app and the Mongo database were designed around these routes, and a lot of functionality could be tested on the server alone.

Cypress was a strong choice for testing on this project as there was a significant amount of early integration testing, and recent updates make it a strong choice for component testing on React too.

Once the React app could send requests to the server, I added the database. Mongo was the database of choice because the data being stored does not require a relational/SQL database, being simple board state.

A blocker that appeared late in the first week was to do with requests from React to submit a move. A timeboxed effort was made to work around this by reworking the game logic so that Redis could store the board state, and was dropped to allow more time for remaining tickets. Using Redis to unblock remains an option, but my recommendation is to resolve this on the frontend if possible.

As these features worked in the server-side tests, submitting player/computer moves was moved to the backlog, enabling other tickets to be worked on. Test routes do exist for the React app to simulate a full game, with each player winning and a draw scenario.

XState was implemented for game state when moving between screens like the menu, the board, and the result per the requirements. It is possible for the board state to be managed in a similar way if this is something the client would like to add, but considering that one of the functional requirements was for a 'thin client' that communicates with a JSON server, my recommendation is to keep the frontend as simple as possible.

The priority early in week 2 was adding Sidekiq, and existing integration tests meant it was straightforward to test that functionality wasn't disrupted. There were no issues with Sidekiq/Redis, and there is scope to extend their functionality in the future if this is something the client is interested in.

Styling the frontend was all done in vanilla CSS, as the only styling requirement (responsive design) was simple to implement. Also, as there is significant scope for development with frontend design and styling, keeping the 'default' method of styling allows more flexibility in future decisions.

## Summary

- Priority was end-to-end communication
- Started with the server and developed app and database around it
- MongoDB chosen because of simple data being stored
- Cypress chosen for component and integration tests due to flexibility and ease of use
- Submitting moves from React blocked, test games added instead
- Explored unblocking with a game-logic refactor, but recommend resolving on React
- Sidekiq/Redis setup relatively straightforward, existing tests used to integrate
- Recommend not using XState for board state on frontend as each request returns the full board
- Only vanilla CSS used due to minimal existing styling and significant scope for future developement 
