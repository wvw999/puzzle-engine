require 'pry'

candidate = [{:x=>1, :y=>1, :letter=>"s"}, {:x=>1, :y=>2, :letter=>"i"}, {:x=>1, :y=>3, :letter=>"i"}, {:x=>1, :y=>4, :letter=>"i"}, {:x=>1, :y=>5, :letter=>"t"}, {:x=>1, :y=>6, :letter=>"a"}, {:x=>1, :y=>7, :letter=>"n"}, {:x=>1, :y=>8, :letter=>"y"}, {:x=>2, :y=>1, :letter=>"n"}, {:x=>2, :y=>2, :letter=>"o"}, {:x=>2, :y=>3, :letter=>"y"}, {:x=>2, :y=>4, :letter=>"b"}, {:x=>2, :y=>5, :letter=>"p"}, {:x=>2, :y=>6, :letter=>"l"}, {:x=>2, :y=>7, :letter=>"t"}, {:x=>2, :y=>8, :letter=>"h"}, {:x=>3, :y=>1, :letter=>"r"}, {:x=>3, :y=>2, :letter=>"s"}, {:x=>3, :y=>3, :letter=>"n"}, {:x=>3, :y=>4, :letter=>"o"}, {:x=>3, :y=>5, :letter=>"s"}, {:x=>3, :y=>6, :letter=>"e"}, {:x=>3, :y=>7, :letter=>"p"}, {:x=>3, :y=>8, :letter=>"h"}, {:x=>4, :y=>1, :letter=>"a"}, {:x=>4, :y=>2, :letter=>"e"}, {:x=>4, :y=>3, :letter=>"o"}, {:x=>4, :y=>4, :letter=>"i"}, {:x=>4, :y=>5, :letter=>"t"}, {:x=>4, :y=>6, :letter=>"i"}, {:x=>4, :y=>7, :letter=>"k"}, {:x=>4, :y=>8, :letter=>"c"}, {:x=>5, :y=>1, :letter=>"e"}, {:x=>5, :y=>2, :letter=>"e"}, {:x=>5, :y=>3, :letter=>"m"}, {:x=>5, :y=>4, :letter=>"i"}, {:x=>5, :y=>5, :letter=>"e"}, {:x=>5, :y=>6, :letter=>"o"}, {:x=>5, :y=>7, :letter=>"o"}, {:x=>5, :y=>8, :letter=>"r"}, {:x=>6, :y=>1, :letter=>"s"}, {:x=>6, :y=>2, :letter=>"s"}, {:x=>6, :y=>3, :letter=>"h"}, {:x=>6, :y=>4, :letter=>"o"}, {:x=>6, :y=>5, :letter=>"t"}, {:x=>6, :y=>6, :letter=>"n"}, {:x=>6, :y=>7, :letter=>"h"}, {:x=>6, :y=>8, :letter=>"f"}, {:x=>7, :y=>1, :letter=>"m"}, {:x=>7, :y=>2, :letter=>"e"}, {:x=>7, :y=>3, :letter=>"p"}, {:x=>7, :y=>4, :letter=>"a"}, {:x=>7, :y=>5, :letter=>"i"}, {:x=>7, :y=>6, :letter=>"o"}, {:x=>7, :y=>7, :letter=>"r"}, {:x=>7, :y=>8, :letter=>"c"}, {:x=>8, :y=>1, :letter=>"n"}, {:x=>8, :y=>2, :letter=>"d"}, {:x=>8, :y=>3, :letter=>"e"}, {:x=>8, :y=>4, :letter=>"s"}, {:x=>8, :y=>5, :letter=>"t"}, {:x=>8, :y=>6, :letter=>"e"}, {:x=>8, :y=>7, :letter=>"a"}, {:x=>8, :y=>8, :letter=>"n"}]
xyvals = [[[6, 1], [5, 1], [4, 1], [5, 2], [4, 2], [3, 1]], [[7, 1], [6, 2], [5, 2], [5, 3], [6, 3]], [[8, 1], [7, 1], [6, 1], [5, 2]], [[7, 1], [7, 2], [8, 2], [7, 3], [8, 3]], [[3, 1], [4, 2], [3, 2], [3, 3], [2, 2], [2, 1], [1, 1], [1, 2], [2, 3], [1, 3], [2, 4], [1, 4], [1, 5], [1, 6]], [[7, 3], [6, 3], [6, 4], [6, 5], [5, 5]], [[8, 3], [7, 4], [8, 4], [8, 5], [8, 6], [7, 7], [8, 8]], [[2, 5], [2, 6], [1, 6], [1, 7]], [[5, 3], [4, 3], [3, 3], [4, 4], [3, 4], [2, 3]], [[2, 5], [3, 4], [3, 5], [4, 4], [4, 5], [4, 6], [5, 6], [6, 6]]]
words = ["search", "chief", "nose", "media", "responsibility", "photo", "eastern", "than", "monkey", "position"]


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
    vals = solution[counter]
    selected = board.select { |boardspace| boardspace[:x] == vals[0] && boardspace[:y] == vals[1] }
    if selected[0][:letter] == letters[counter]
      selected[0][:letter] = " "
    end
    counter += 1
  end
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
# outputviewer(tempboard)
words.length.times do |checkword|
  word = words.pop
  coords = xyvals.pop
  output = wipeword(word,tempboard,coords)
  columns = puzzlesplitter(output)
  tempboard = columnwriter(columns,output)
  # outputviewer(tempboard)
end
