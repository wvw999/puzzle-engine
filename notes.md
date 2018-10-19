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
'99' is a blank space
these values are arbitrary
this API will attempt to do this job without using recursion

[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


this is a board in progress of being built,
most problems emerge when the *last* word is
being placed. the spaces need to be next to
each other, and often the engine can't locate
enough spaces because they are not all contiguous

so I get a nil exception.

making it stop is my whack-a-mole this week

[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, "s", "s", 99, 99, "s", "u", 99, 99, 1,
1, "m", "a", "a", "c", "h", "e", 99, 99, 1,
1, 99, 99, 99, 99, 99, "t", 99, 99, 1,
1, 99, 99, 99, 99, "t", 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, "s", 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99, 1,
1, 99, 99, 99, 99, 99, 99, 99, 99,
1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

**things below this point are mostly garbage data I threw in here while working**


[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
1, "d", "p", "n", 99, "o", "e", "a", "t", 1,
1, "o", "m", "i", 99, "n", "k", 99, "d", 1,
1, "i", "k", "t", "r", 99, "l", "d", "r", 1,
1, "h", "r", "e", "s", "t", "d", "a", "e", 1,
1, "f", "a", "r", "e", "t", "e", "e", "i", 1,
1, "t", "x", "e", "d", "o", "s", "r", "n", 1,
1, "i", "a", "c", 99, "r", "u", "n", "s", 1,
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

git config --global credential.helper "cache --timeout=99600"

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






big chunk of older board code --

def word_spaces_selector

      (@word_length - 1).times do |pickspaces|
        @list_of_neighbors = ["q"]
        @steps.each do |buildneighbors|
          if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + buildneighbors)
            @list_of_neighbors.push(@sub_candidate_word_array[-1] + buildneighbors)
          end
        end
        if @list_of_neighbors.length <= 0
          stepsone
        end
        if @list_of_neighbors.length <= 0
          # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
          stepstwo
        end
        if @list_of_neighbors.length <= 0
          # if the neighbor check fails the array will be empty, look again for everything that's left
          stepsthree
        end

        if @list_of_neighbors == ["q"] || @list_of_neighbors.include?(nil)
          @selectbreaker = 1
          puts "hit selectbreaker on line 111"
          next
        end
        # removes the newly selected next space on board from the array of candidates in list_of_ninenine
        @list_of_neighbors.delete("q")
        @sub_candidate_word_array.push(@list_of_neighbors.sample)
        @list_of_ninenine.delete(@sub_candidate_word_array[-1])
      end
      if @list_of_neighbors.length <= 0
        # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
        stepsone
      end
      if @list_of_neighbors.length <= 0
        # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
        stepstwo
      end
      if @list_of_neighbors.length <= 0
        # if the neighbor check fails the array will be empty, look again for everything that's left
        stepsthree
      end

      if @list_of_neighbors == [] || @list_of_neighbors.include?(nil)
        @selectbreaker = 1
        next
      end
      # removes the newly selected next space on board from the array of candidates in list_of_ninenine
      @candidate_word_array.push(@list_of_neighbors.sample)
      @list_of_ninenine.delete(@candidate_word_array[-1])
    end
    @loop_counter += 1
    if @candidate_word_array.include?(nil) || @candidate_word_array.length != lengthofword
      @selectbreaker = 1
    end
    if @selectbreaker == 1 || @loop_counter > 20000
      return false
    else
      @candidate_word_array
      @candidate_word_array.push(@sub_candidate_word_array)
    end
  end
   def stepsone
    @stepsupone.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdownone.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end
   def stepstwo
    @stepsuptwo.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdowntwo.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end
   def stepsthree
    @stepsupthree.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdownthree.each do |addtoneighbors|
      if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end
