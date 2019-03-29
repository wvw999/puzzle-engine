# WordBrain puzzle game clone - version 0.2

This brings the basic functionality of generating solve-able puzzles like the ones in the popular mobile app, 'wordbrain'

It is being built out in three parts:

1. a puzzle generator that collects words from the dictionary (included), builds solvable puzzles by playing the game onto the board backwards, and saves the puzzle to the database (complete)
2. a puzzle verifier, which uses the solution set to play through the board and ensure the generator did not make any mistakes- will delete any bad boards from DB. (built but not implemented yet)
3. react-based front end which accepts the board/words data generated by no. 1 allows a user to play the game (coming soon)

to see how the original game works, check out this video of some gameplay
https://www.youtube.com/watch?v=GwqPBV-yeXw

## Technology used

Ruby version 2.5.0, Rails 5.2.1, psql, javascript, react

## Get the code up and running

Clone repo, create database following standard ruby/rails/activerecord methods, migrate database, run seed file (no seed file yet- generator will work with empty DB).

While the vast majority of the difficult coding has been completed, the app current does not appear to do much.

Run the rails server. Navigate to https://0.0.0.0:3000/puzzles , and it should return either a [built game board, word set, and solution set],  or 'false' if it was unable to complete a board. This may take 3-5 minutes.

Check the database puzzles table if it completes a board, it should appear stored there. The board can later be recalled from the database.

Navigating to https://0.0.0.0:3000/puzzles/1 should show the puzzle that was generated.

Functionality to run the verification step mentioned in no. 2 above is built but not yet hooked up. Eventually this will be used to proof all stored game boards.

A proofed set of boards will then be used to create the seed file which will come with the react front end and complete the package.

As I will be learning react from scratch, eta of working front end is unknown.

## License

This software is licensed under the MIT license.

Copyright (c)2018 **Will Swanson**
