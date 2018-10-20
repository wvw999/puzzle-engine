


1, 9, 9, a, r, e, t, c, o, 1,
1, m, c, b, 9, d, a, e, s, 1,
1, 9, i, 9, o, 9, g, t, 9, 1,
1, n, f, i, n, i, a, o, t, 1,
1, i, i, c, f, 9, r, 9, s, 1,
1, n, m, n, a, e, r, 9, 9, 1,
1, g, s, u, t, l, o, 9, s, 1,
1, 9, i, 9, m, 9, y, u, 9, 1,



[11, 12, 24, 31, 33, 35, 38, 55, 57, 67, 68, 77, 81, 83, 85, 88]


["significantly", "carboniferous", "storage", "minimum", "cost", "date", "margin", "margin", "away"]



to see how this game works, check out
https://www.youtube.com/watch?v=GwqPBV-yeXw

this API is meant to
1. build a board of letters
2. verify user plays
3. update board after valid user play
4. verify that built boards are solve-able

I am currently on #1
there is no functionality for 2, 3, 4 built yet

API end point for #1 is http://localhost:3000/puzzles
I just began re-building this from scratch,
so currently the code does not run

this is the game board
just an array, but with the data set up
in such a way as to represent an 8x8 grid
'0' represents the top and bottom of the board
'1' represents right and left edges
'9' is a blank space
these values are arbitrary
this API will attempt to do this job without using recursion

[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


this is a board in progress of being built,
most problems emerge when the *last* word is
being placed. the spaces need to be next to
each other, and often the engine can't locate
enough spaces because they are not all contiguous

so I get a nil exception.

making it stop is my whack-a-mole this week

[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, "s", "s", 9, 9, "s", "u", 9, 9, 1,
1, "m", "a", "a", "c", "h", "e", 9, 9, 1,
1, 9, 9, 9, 9, 9, "t", 9, 9, 1,
1, 9, 9, 9, 9, "t", 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, "s", 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9, 1,
1, 9, 9, 9, 9, 9, 9, 9, 9,
1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

**things below this point are mostly garbage data I threw in here while working**


[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, "d", "p", "n", 9, "o", "e", "a", "t", 1,
1, "o", "m", "i", 9, "n", "k", 9, "d", 1,
1, "i", "k", "t", "r", 9, "l", "d", "r", 1,
1, "h", "r", "e", "s", "t", "d", "a", "e", 1,
1, "f", "a", "r", "e", "t", "e", "e", "i", 1,
1, "t", "x", "e", "d", "o", "s", "r", "n", 1,
1, "i", "a", "c", 9, "r", "u", "n", "s", 1,
1, "a", "e", "l", "c", "a", "x", "a", "u", 1,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

experimental
undertake
counselor
extent
aids
radar
draft
sick
idaho
heron

[0,0,0,0,0,0,0,0,0,0,
1,"o","w","c","a","u","y","i","v",1,
1,"n","a","r","r","e","n","j","n",1,
1,"a","d","e","e","y","t","r","i",1,
1,"r","s","t","l","s","r","u","p",1,
1,"i","e","a","r","t","i","q","a",1,
1,"b","a","c","c","v","l","e","a",1,
1,"a","m","r","t","a","l","a","n",1,
1,"i","n","c","e","l","o","a","m",1,
0,0,0,0,0,0,0,0,0,0]

preliminary
quantity
bacteria
caracal
navajo
cruel
side
tern
serval
woman

[0,0,0,0,0,0,0,0,0,0,
1,"w","i","f","n","i","m","s","a",1,
1,"a","c","r","l","e","m","a","t",1,
1,"v","e","d","t","l","p","k","a",1,
1,"l","i","e","m","e","l","t","b",1,
1,"n","e","e","i","e","p","o","l",1,
1,"l","x","a","c","s","n","i","n",1,
1,"y","t","l","e","e","s","t","t",1,
1,"l","b","a","e","e","o","a","o",1,
0,0,0,0,0,0,0,0,0,0]

implementation
relatively
waxbill
species
feel
alaska
bottom
candle
teen


javascript

install node

brew install node
npm install -g @angular/cli@1.6.5
Run npm install from project directory.
Run ng serve --open for a dev server. It should bring up the page automatically, but navigate to http://localhost:4200/

actual usable board spaces if needed

[-11, -10, -9, -1, 1, 9, 10, 11]

git config --global credential.helper "cache --timeout=9600"

[{"id":1,"board":["0","0","0","0","0","0","0","0","0","0","1","z","z","z","z","z","z","z","a","1","1","z","z","z","z","z","z","z","b","1","1","z","z","z","z","z","z","z","c","1","1","w","o","r","d","g","a","m","e","1","1","z","z","z","z","z","z","z","d","1","1","z","z","z","z","z","z","z","e","1","1","z","z","z","z","z","z","z","f","1","1","z","z","z","z","z","z","z","g","1","0","0","0","0","0","0","0","0","0","0"],"words":["zzzzzzza","zzzzzzzb","zzzzzzzc","zzzzzzzd","zzzzzzze","zzzzzzzf","zzzzzzzg","wordgame"],"created_at":"2018-10-01T18:01:52.013Z","updated_at":"2018-10-01T18:01:52.013Z"}]




rails server -p 3001
Normally in your terminal you can try Ctrl + C to shutdown the server.

The other way to kill the Ruby on Rails default server (which is WEBrick) is:

kill -INT $(cat tmp/pids/server.pid)
In your terminal to find out the PID of the process:

lsof -wni tcp:3000
Then, use the number in the PID column to kill the process:

For example:

$ kill -9 PID



[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1,  99,  99,  99,  99,  99,  99,  99,  99, 1,
1,  99, "t", "a", "m", "i",  99,  99,  99, 1,
1, "e",  99,  99,  99, "s", "t", "v",  99, 1,
1,  99,  99, "e", "n", "e", "l", "o", "i", 1,
1,  99,  99, "c",  99, "e", "s", "s", "o", 1,
1,  99,  99,  99,  99,  99, "i", "i", "n", 1,
1,  99, "a", "r", "t", "n",  99, "m",  99, 1,
1,  99, "t", "h", "a",  99, "s",  99,  99, 1,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0]





















,
