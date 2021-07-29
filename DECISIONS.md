## Approach

The early focus on this project was getting a walking skeleton going, with the frontend app, the server, and the database communicating. With this in mind, a Ruby Gem containing the game logic and a Sinatra server with a couple of routes were prioritised. The React app and the Mongo database were designed around these routes, and a lot of functionality could be tested on the server alone.

The game logic in the Gem was designed with extensibility in mind, being dependency-light and avoiding hard-coded values where possible. For example, if different board-sizes were a future feature, it would only require refactoring diagonal victory checks. However, further customisation such as player names and alternative markers should be implemented on the frontend to keep the Gem small, and the data passed through the server consistent and lightweight.

Cypress was a strong choice for testing on this project as there was a significant amount of early integration testing, and recent updates make it a strong choice for component testing on React too. It also allows for future snapshot testing, which would be useful as the frontend develops. A tradeoff with using Cypress on the front and back ends is that two sessions do not run well together, so it is necessary to stop one to run another. However, this is a minor issue as each end can be tested separately when deploying, and it is unlikely that both suites need to be running simultaneously during deployment.
At this stage, testing provides a lot of confidence and clarity in what works in the application and how. Adding a test environment in the next iteration would not only increase confidence in the stability of the application, but also facilitate deploying to production in the near future.

Once the React app could send requests to the server, I added the database. Mongo was the database of choice because the data being stored does not require a relational/SQL database, being simple board state. The tradeoff here is that as more features are added to the app, it may become easier to migrate away from Mongo to a relational database.

A blocker that appeared late in the first week was to do with requests from React to submit a move. A timeboxed effort was made to work around this by reworking the game logic so that Redis could store the board state, and was dropped to allow more time for remaining tickets. Using Redis to unblock remains an option, but my recommendation is to resolve this on the frontend if possible.

As these features worked in the server-side tests, submitting player/computer moves was moved to the backlog, enabling other tickets to be worked on. Test routes do exist for the React app to simulate a full game, with each player winning and a draw scenario.

XState was implemented for game state when moving between screens like the menu, the board, and the result per the requirements. It is possible for the board state to be managed in a similar way if this is something the client would like to add, but considering that one of the functional requirements was for a 'thin client' that communicates with a JSON server, my recommendation is to keep the frontend as simple as possible.

The priority early in week 2 was adding Sidekiq, and existing integration tests meant it was straightforward to test that functionality wasn't disrupted. There were no issues with Sidekiq/Redis, and there is scope to extend their functionality in the future if this is something the client is interested in.

Styling the frontend was all done in vanilla CSS, as the only styling requirement (responsive design) was simple to implement. Also, as there is significant scope for development with frontend design and styling, keeping the 'default' method of styling allows more flexibility in future decisions.

Although deployment was not scoped for this iteration, it's worth considering how it could be achieved. For the purposes of early development, this app is managed all in one repo - an approach I recommend continuing during this early stage. With this in mind, creating a Dockerfile each for the frontent and the backend allows us to configure and start both containers in the local development environment, as well as deploying on AWS Elastic Beanstalk or a similar service.

Overall, this iteration has seen a lot of infrastructure and early features completed. With the proof of concept done, we can see some possible directions for future development, with my personal recommendation being to move forward with submitting moves on the React app, as well as deploying the repo so that true end-to-end tests can be implemented, as well as any security features required necessitated by CI/CD.

## Summary

- Priority was end-to-end communication
- Started with the server and developed app and database around it
- MongoDB chosen because of simple data being stored, may choose to move to SQL at a later date
- Cypress chosen for component and integration tests due to flexibility and ease of use
- Worth adding a test environment to ease future deployment
- Submitting moves from React blocked, test games added instead
- Explored unblocking with a game-logic refactor, but recommend resolving on React
- Sidekiq/Redis setup relatively straightforward, existing tests used to integrate
- Recommend not using XState for board state on frontend as each request returns the full board
- Only vanilla CSS used due to minimal existing styling and significant scope for future developement
- Can deploy the monorepo with Docker and AWS Elastic Beanstalk
- Deploying in the near future will provide an opportunity to refine server security
