require 'pry'

candidate = [{:x=>1, :y=>1, :letter=>"i"}, {:x=>1, :y=>2, :letter=>"t"}, {:x=>1, :y=>3, :letter=>"e"}, {:x=>1, :y=>4, :letter=>"l"}, {:x=>1, :y=>5, :letter=>"s"}, {:x=>1, :y=>6, :letter=>"n"}, {:x=>1, :y=>7, :letter=>"i"}, {:x=>1, :y=>8, :letter=>"y"}, {:x=>2, :y=>1, :letter=>"y"}, {:x=>2, :y=>2, :letter=>"b"}, {:x=>2, :y=>3, :letter=>"a"}, {:x=>2, :y=>4, :letter=>"s"}, {:x=>2, :y=>5, :letter=>"r"}, {:x=>2, :y=>6, :letter=>"e"}, {:x=>2, :y=>7, :letter=>"i"}, {:x=>2, :y=>8, :letter=>"t"}, {:x=>3, :y=>1, :letter=>"r"}, {:x=>3, :y=>2, :letter=>"e"}, {:x=>3, :y=>3, :letter=>"e"}, {:x=>3, :y=>4, :letter=>"e"}, {:x=>3, :y=>5, :letter=>"a"}, {:x=>3, :y=>6, :letter=>"c"}, {:x=>3, :y=>7, :letter=>"h"}, {:x=>3, :y=>8, :letter=>"s"}, {:x=>4, :y=>1, :letter=>"d"}, {:x=>4, :y=>2, :letter=>"i"}, {:x=>4, :y=>3, :letter=>"k"}, {:x=>4, :y=>4, :letter=>"s"}, {:x=>4, :y=>5, :letter=>"p"}, {:x=>4, :y=>6, :letter=>"o"}, {:x=>4, :y=>7, :letter=>"r"}, {:x=>4, :y=>8, :letter=>"n"}, {:x=>5, :y=>1, :letter=>"t"}, {:x=>5, :y=>2, :letter=>"n"}, {:x=>5, :y=>3, :letter=>"i"}, {:x=>5, :y=>4, :letter=>"e"}, {:x=>5, :y=>5, :letter=>"e"}, {:x=>5, :y=>6, :letter=>"a"}, {:x=>5, :y=>7, :letter=>"n"}, {:x=>5, :y=>8, :letter=>"o"}, {:x=>6, :y=>1, :letter=>"h"}, {:x=>6, :y=>2, :letter=>"a"}, {:x=>6, :y=>3, :letter=>"m"}, {:x=>6, :y=>4, :letter=>"h"}, {:x=>6, :y=>5, :letter=>"f"}, {:x=>6, :y=>6, :letter=>"p"}, {:x=>6, :y=>7, :letter=>"o"}, {:x=>6, :y=>8, :letter=>"t"}, {:x=>7, :y=>1, :letter=>"c"}, {:x=>7, :y=>2, :letter=>"n"}, {:x=>7, :y=>3, :letter=>"o"}, {:x=>7, :y=>4, :letter=>"t"}, {:x=>7, :y=>5, :letter=>"p"}, {:x=>7, :y=>6, :letter=>"o"}, {:x=>7, :y=>7, :letter=>"n"}, {:x=>7, :y=>8, :letter=>"m"}, {:x=>8, :y=>1, :letter=>"s"}, {:x=>8, :y=>2, :letter=>"i"}, {:x=>8, :y=>3, :letter=>"o"}, {:x=>8, :y=>4, :letter=>"i"}, {:x=>8, :y=>5, :letter=>"o"}, {:x=>8, :y=>6, :letter=>"s"}, {:x=>8, :y=>7, :letter=>"h"}, {:x=>8, :y=>8, :letter=>"e"}]
xyvals = [[[3, 1], [3, 2], [4, 1], [4, 2], [4, 3], [4, 4], [3, 3], [2, 2], [2, 1], [1, 1], [1, 2], [1, 3], [2, 3], [1, 4]], [[3, 3], [2, 2], [2, 3], [1, 2], [1, 3], [2, 4], [1, 5]], [[7, 1], [8, 1], [8, 2], [8, 3]], [[7, 2], [6, 1], [5, 1], [4, 1], [3, 2], [2, 1]], [[1, 5], [2, 6], [3, 5], [4, 5], [3, 6], [3, 7]], [[6, 1], [5, 1], [4, 1], [4, 2], [5, 2]], [[7, 2], [8, 3], [7, 3], [6, 3], [5, 4]], [[6, 2], [7, 2], [8, 1], [8, 2], [7, 3], [8, 4], [8, 5], [7, 6]], [[7, 1], [6, 2], [5, 1], [5, 2], [6, 3]], [[5, 1], [6, 1], [6, 2], [5, 2]]]
words = ["responsibility", "eastern", "nose", "monkey", "search", "media", "photo", "position", "chief", "than"]


# candidate = [{:x=>1, :y=>1, :letter=>"p"}, {:x=>1, :y=>2, :letter=>"o"}, {:x=>1, :y=>3, :letter=>"t"}, {:x=>1, :y=>4, :letter=>"o"}, {:x=>1, :y=>5, :letter=>"m"}, {:x=>1, :y=>6, :letter=>"o"}, {:x=>1, :y=>7, :letter=>"n"}, {:x=>1, :y=>8, :letter=>"n"}, {:x=>2, :y=>1, :letter=>"h"}, {:x=>2, :y=>2, :letter=>"e"}, {:x=>2, :y=>3, :letter=>"r"}, {:x=>2, :y=>4, :letter=>"o"}, {:x=>2, :y=>5, :letter=>"s"}, {:x=>2, :y=>6, :letter=>"p"}, {:x=>2, :y=>7, :letter=>"o"}, {:x=>2, :y=>8, :letter=>"k"}, {:x=>3, :y=>1, :letter=>"t"}, {:x=>3, :y=>2, :letter=>"p"}, {:x=>3, :y=>3, :letter=>"i"}, {:x=>3, :y=>4, :letter=>"s"}, {:x=>3, :y=>5, :letter=>"n"}, {:x=>3, :y=>6, :letter=>"e"}, {:x=>3, :y=>7, :letter=>"i"}, {:x=>3, :y=>8, :letter=>"t"}, {:x=>4, :y=>1, :letter=>"s"}, {:x=>4, :y=>2, :letter=>"s"}, {:x=>4, :y=>3, :letter=>"y"}, {:x=>4, :y=>4, :letter=>"b"}, {:x=>4, :y=>5, :letter=>"i"}, {:x=>4, :y=>6, :letter=>"h"}, {:x=>4, :y=>7, :letter=>"i"}, {:x=>4, :y=>8, :letter=>"e"}, {:x=>5, :y=>1, :letter=>"e"}, {:x=>5, :y=>2, :letter=>"o"}, {:x=>5, :y=>3, :letter=>"i"}, {:x=>5, :y=>4, :letter=>"a"}, {:x=>5, :y=>5, :letter=>"c"}, {:x=>5, :y=>6, :letter=>"i"}, {:x=>5, :y=>7, :letter=>"a"}, {:x=>5, :y=>8, :letter=>"f"}, {:x=>6, :y=>1, :letter=>"r"}, {:x=>6, :y=>2, :letter=>"e"}, {:x=>6, :y=>3, :letter=>"d"}, {:x=>6, :y=>4, :letter=>"n"}, {:x=>6, :y=>5, :letter=>"e"}, {:x=>6, :y=>6, :letter=>"l"}, {:x=>6, :y=>7, :letter=>"i"}, {:x=>6, :y=>8, :letter=>"t"}, {:x=>7, :y=>1, :letter=>"h"}, {:x=>7, :y=>2, :letter=>"m"}, {:x=>7, :y=>3, :letter=>"a"}, {:x=>7, :y=>4, :letter=>"s"}, {:x=>7, :y=>5, :letter=>"n"}, {:x=>7, :y=>6, :letter=>"o"}, {:x=>7, :y=>7, :letter=>"e"}, {:x=>7, :y=>8, :letter=>"y"}, {:x=>8, :y=>1, :letter=>"t"}, {:x=>8, :y=>2, :letter=>"n"}, {:x=>8, :y=>3, :letter=>"e"}, {:x=>8, :y=>4, :letter=>"a"}, {:x=>8, :y=>5, :letter=>"r"}, {:x=>8, :y=>6, :letter=>"s"}, {:x=>8, :y=>7, :letter=>"c"}, {:x=>8, :y=>8, :letter=>"h"}]
# xyvals = [[[1, 1], [1, 2], [1, 3], [2, 2], [3, 1], [4, 1]], [[7, 1], [8, 1], [8, 2], [8, 3], [8, 4], [8, 5]], [[2, 1], [2, 2], [3, 1], [4, 2], [3, 3], [4, 3], [5, 2], [6, 1]], [[6, 2], [5, 2], [4, 1], [3, 1], [2, 1], [2, 2], [3, 3]], [[6, 1], [5, 1], [4, 2], [3, 2], [2, 3], [1, 4], [2, 4], [3, 3], [4, 4], [5, 3], [6, 4], [6, 5], [6, 6], [7, 5]], [[1, 1], [2, 1], [1, 2], [1, 3], [1, 4]], [[8, 1], [7, 1], [7, 2], [8, 2]], [[7, 2], [6, 2], [6, 3], [5, 3], [5, 4]], [[7, 5], [7, 6], [8, 6], [7, 7]], [[5, 5], [4, 6], [3, 7], [4, 8], [5, 8]]]
# words = ["monkey", "search", "position", "eastern", "responsibility", "photo", "than", "media", "nose", "chief"]

# verify that word is in location indicated
# delete letters for word from board
# move spaces up
# repeat
# check that board is clear at end

def puzzlesplitter(board)
  tempboard = []
    xcounter = 1
    ycounter = 1
  8.times do |countcols|
    firstarr = board.select { |char| char[:x] == xcounter && (1..8).include?(char[:y]) && char[:letter] != " "}
    outputarr = []
    firstarr.each do |upload|
      outputarr.push upload[:letter]
    end
    tempboard.push outputarr
    xcounter += 1
  end
  return tempboard
end

def columnwriter(columns, board)
  tempboard = []
  xcounter = 0
  columns.each do |fill|
    if fill.length < 8
      (8 - fill.length).times do
        fill.push " "
      end
    end
  end
  8.times do
    ycounter = 0
    8.times do
      newhash = Hash[:x, xcounter+1, :y, ycounter+1, :letter, columns[xcounter][ycounter]]
      tempboard.push newhash
      ycounter += 1
    end
    xcounter += 1
  end
  return tempboard
end

def wipeword(word,board,solution)
  letters = word.split("")
  counter = 0
  word.length.times do |update|
    # if word == "than"
    #   binding.pry
    # end

    vals = solution[counter]
    selected = board.select { |boardspace| boardspace[:x] == vals[0] && boardspace[:y] == vals[1] }
    if selected[0][:letter] == letters[counter]
      puts " found '#{letters[counter]}' at #{selected[0]}"
      selected[0][:letter] = " "
    else
      puts "      crap. '#{letters[counter]}' at #{selected[0]}"
    end
    # if word == "than"
    #   binding.pry
    # end
    counter += 1
  end
  print letters
  puts " "
  print solution
  puts " "
  print board
  return board
end

def outputviewer(board)
  puts " "
  xval = 0
  8.times do |bim|
    xval += 1
    yval = 0
    8.times do |bap|
      yval += 1
      print "#{xval} , #{yval} :"
      board.each do |putz|
        if putz[:x] == xval && putz[:y] == yval
          print "\"#{putz[:letter]}\" "
          if yval == 8
            puts "\n"
          end
        end
      end
    end
  end
  puts "\n\n"
end

tempboard = candidate.clone
words.length.times do |checkword|
  word = words.pop
  coords = xyvals.pop
  puts "working on word #{word}"
  output = wipeword(word,tempboard,coords)
  columns = puzzlesplitter(output)
  puts " "
  print output
  tempboard = columnwriter(columns,output)
  puts " "
  print tempboard
  # puts "board after removing #{word}"
  outputviewer(tempboard)
end
