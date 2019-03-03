{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
{"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
{"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
{"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
{"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
{"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
{"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
{"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"z"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]


# this block draws out a sample board for preview in html
# cannot just read board directly because board is initial value x1y1 is in lower left instead of upper left

# @x = 1
# @y = 8
# 64.times do |print|
#   testboard.each do |web|
#     if web[:x].to_i === @x
#       if web[:y].to_i === @y
#         print "<td> "
#         print web[:letter]
#         print " </td>"
#       end
#     end
#   end
#   if @x == 8
#     @x = 1
#     @y -= 1
#   else
#     @x += 1
#   end
# end

* builder is complete: can easily generate a board.
moving on to move updater, which will shift the letters when a successful play is made

also on the to-do list:
game turn manager
  start of game:
    get board from database
  ongoing maint:
    display board on page
    track words found
    display found words on page
  win:
    all words found (end on last word found)


"experimental"=> [["e", 2, 1],  ["x", 1, 1],  ["p", 2, 2],  ["e", 2, 3],  ["r", 3, 3],  ["i", 4, 3],  ["m", 3, 2],  ["e", 3, 1],  ["n", 4, 1],  ["t", 5, 1],  ["a", 5, 2],  ["l", 6, 3]],
"undertake"=> [["u", 1, 2],  ["n", 1, 3],  ["d", 1, 4],  ["e", 2, 5],  ["r", 1, 5],  ["t", 2, 4],  ["a", 3, 4],  ["k", 4, 5],  ["e", 4, 4]],
"counselor"=> [["c", 7, 2],  ["o", 6, 2],  ["u", 6, 1],  ["n", 7, 1],  ["s", 8, 1],  ["e", 8, 2],  ["l", 8, 3],  ["o", 8, 4],  ["r", 7, 4]],
"extent"=>[["e", 8, 7], ["x", 7, 6], ["t", 7, 5], ["e", 6, 5], ["n", 6, 4], ["t", 7, 3]],
"radar"=>[["r", 3, 7], ["a", 2, 7], ["d", 3, 6], ["a", 3, 5], ["r", 2, 6]],
"draft"=>[["d", 1, 8], ["r", 1, 7], ["a", 2, 8], ["f", 3, 8], ["t", 4, 8]],
"idaho"=>[["i", 6, 6], ["d", 7, 7], ["a", 8, 8], ["h", 7, 8], ["o", 6, 7]],
"heron"=>[["h", 5, 6], ["e", 4, 6], ["r", 4, 7], ["o", 5, 8], ["n", 6, 8]],
"aims"=>[["a", 5, 3], ["i", 4, 2], ["m", 5, 4], ["s", 5, 5]],
"sick"=>[["s", 5, 7]]}

[[{"x":1,"y":1,"letter":"t"}
{"x":1,"y":2,"letter":"m"}
{"x":1,"y":3,"letter":"a"}
{"x":1,"y":4,"letter":"i"}
{"x":1,"y":5,"letter":"n"}
{"x":1,"y":6,"letter":"e"}
{"x":1,"y":7,"letter":"m"}
{"x":1,"y":8,"letter":"o"}

{"x":2,"y":1,"letter":"a"}
{"x":2,"y":2,"letter":"t"}
{"x":2,"y":3,"letter":"r"}
{"x":2,"y":4,"letter":"r"}
{"x":2,"y":5,"letter":"e"}
{"x":2,"y":6,"letter":"m"}
{"x":2,"y":7,"letter":"n"}
{"x":2,"y":8,"letter":"i"}

{"x":3,"y":1,"letter":"r"}
{"x":3,"y":2,"letter":"u"}
{"x":3,"y":3,"letter":"l"}
{"x":3,"y":4,"letter":"n"}
{"x":3,"y":5,"letter":"e"}
{"x":3,"y":6,"letter":"u"}
{"x":3,"y":7,"letter":"r"}
{"x":3,"y":8,"letter":"s"}

{"x":4,"y":1,"letter":"n"}
{"x":4,"y":2,"letter":"u"}
{"x":4,"y":3,"letter":"c"}
{"x":4,"y":4,"letter":"n"}
{"x":4,"y":5,"letter":"t"}
{"x":4,"y":6,"letter":"e"}
{"x":4,"y":7,"letter":"t"}
{"x":4,"y":8,"letter":""}

{"x":5,"y":1,"letter":"a"}
{"x":5,"y":2,"letter":"e"}
{"x":5,"y":3,"letter":"i"}
{"x":5,"y":4,"letter":"t"}
{"x":5,"y":5,"letter":"e"}
{"x":5,"y":6,"letter":"x"}
{"x":5,"y":7,"letter":"t"}
{"x":5,"y":8,"letter":"s"}

{"x":6,"y":1,"letter":"i"}
{"x":6,"y":2,"letter":"d"}
{"x":6,"y":3,"letter":"i"}
{"x":6,"y":4,"letter":"t"}
{"x":6,"y":5,"letter":"n"}
{"x":6,"y":6,"letter":"e"}
{"x":6,"y":7,"letter":"i"}
{"x":6,"y":8,"letter":"n"}

{"x":7,"y":1,"letter":"m"}
{"x":7,"y":2,"letter":"c"}
{"x":7,"y":3,"letter":"s"}
{"x":7,"y":4,"letter":"d"}
{"x":7,"y":5,"letter":"m"}
{"x":7,"y":6,"letter":"i"}
{"x":7,"y":7,"letter":"r"}
{"x":7,"y":8,"letter":"a"}

{"x":8,"y":1,"letter":"e"}
{"x":8,"y":2,"letter":"a"}
{"x":8,"y":3,"letter":"t"}
{"x":8,"y":4,"letter":"e"}
{"x":8,"y":5,"letter":"a"}
{"x":8,"y":6,"letter":"c"}
{"x":8,"y":7,"letter":"h"}
{"x":8,"y":8,"letter":"t"}],[
"ultramarine","instrument","existence","indicate","merchant","remote","aids","meat","unit"],{
"ultramarine":[["u",4,2],["l",3,3],["t",2,2],["r",3,1],["a",2,1],["m",1,2],["a",1,3],["r",2,3],["i",1,4],["n",1,5],["e",1,6]],
"instrument":[["i",2,8],["n",2,7],["s",3,8],["t",4,7],["r",3,7],["u",3,6],["m",2,6],["e",3,5],["n",4,4],["t",4,5]],
"existence":[["e",5,5],["x",5,6],["i",6,7],["s",5,8],["t",5,7],["e",4,6],["n",3,4],["c",4,3],["e",5,2]],
"indicate":[["i",7,6],["n",6,5],["d",7,4],["i",6,3],["c",7,2],["a",8,2],["t",8,3],["e",8,4]],
"merchant":[["m",7,5],["e",6,6],["r",7,7],["c",8,6],["h",8,7],["a",7,8],["n",6,8],["t",5,4]],
"remote":[["r",2,4],["e",2,5],["m",1,7],["o",1,8],["t",1,1]],
"aids":[["a",5,1],["i",6,1],["d",6,2],["s",7,3]],
"meat":[["m",7,1],["e",8,1],["a",8,5],["t",8,8]],
"unit":[["u",3,2],["n",4,1],["i",5,3],["t",6,4]]}]


ultramarineinstrumentexistenceindicatemerchantremoteaidsmeatunit



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

class Board
  empty
end

class BoardSpace
end


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
