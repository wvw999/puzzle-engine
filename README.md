# WordBrain puzzle game clone - initial attempt at basic functionality

This is an attempt to clone a popular word game, 'wordbrain'

It is being built out in three parts:

1. a puzzle generator that collects words from the dictionary (included) and saves them (complete except storage)
2. a puzzle solver that guarantees the puzzles created by #1 are solvable (in process)
3. the gameplay engine which allows a user to play the game (coming soon)

to see how the original game works, check out
https://www.youtube.com/watch?v=GwqPBV-yeXw

this project was initially being built out as an API, though, as the creation/solving aspect of this is time consuming, it is no longer an API

the board has been re-imagined, and is now a hash of X, Y values and an associated letter.

there is not currently any javascript front end, it will come as part of #3.

## Technology used

Ruby version 2.5.0, Rails 5.2.1, psql

## Get the code up and running

Clone repo, create database, migrate database, run seed file.

Run the rails server. You can check the routes, currently the only functioning route is /puzzles , and it returns either a built game board, or an error. This is currently in development.

## License

This software is licensed under the MIT license.

Copyright (c)2018 **Will Swanson**
