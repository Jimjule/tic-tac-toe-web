# Tic-Tac-Toe Web

A Tic-Tac-Toe game that runs on a webpage. Communicates with a JSON backend.

# Installation

- Download to your target folder
- In `tic-tac-toe-frontend`, run `yarn install`
- In `tic-tac-toe-frontend`, run `shotgun config.ru -p 4567`
- Then, run `yarn start` to run the web-app

# Running tests

- In `tic-tac-toe-frontend` and `sinatra_server`, run `npx cypress open`
- In `tic_tac_toe_logic` run `rspec`