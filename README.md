# WordBrain puzzle game clone

This is the base API for the logic side of the game. It uses a dictionary to select words totalling 64 letters in length, then assemble them into an 8x8 grid, such that they are hidden/somewhat hidden.

When future functionality is added, the player will be able to select letters and submit them, the engine will decide whether the move was valid, and if so, it will re-draw the board with the letters removed, and also slide all above letters down (similar to tetris or bejeweled).

A final piece of functionality is a board checker- it will validate whether or not the game boards built by the builder engine can actually be solved.

## Ruby version 2.5.0, Rails 5.2.1, psql

## Get the API up and running

Clone repo, create database, migrate database, run seed file.

Run the rails server. You can check the routes, currently the only functioning route is /puzzles , and it returns either a built game board, or an error. This is currently in development.

## License

This software is licensed under the MIT license.

Copyright (c)2018 **Will Swanson**
