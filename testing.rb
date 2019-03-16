#
# testwords = ["responsibility", "position", "eastern", "search", "monkey", "media", "photo", "chief", "than", "nose"]
#

# testboard = [{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
# {"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
# {"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
# {"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
# {"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
# {"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
# {"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
# {"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"s"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]

blankboard = [{"x":1,"y":1,"letter":" "},{"x":1,"y":2,"letter":" "},{"x":1,"y":3,"letter":" "},{"x":1,"y":4,"letter":" "},{"x":1,"y":5,"letter":" "},{"x":1,"y":6,"letter":" "},{"x":1,"y":7,"letter":" "},{"x":1,"y":8,"letter":" "},
{"x":2,"y":1,"letter":" "},{"x":2,"y":2,"letter":" "},{"x":2,"y":3,"letter":" "},{"x":2,"y":4,"letter":" "},{"x":2,"y":5,"letter":" "},{"x":2,"y":6,"letter":" "},{"x":2,"y":7,"letter":" "},{"x":2,"y":8,"letter":" "},
{"x":3,"y":1,"letter":"b"},{"x":3,"y":2,"letter":" "},{"x":3,"y":3,"letter":" "},{"x":3,"y":4,"letter":" "},{"x":3,"y":5,"letter":" "},{"x":3,"y":6,"letter":" "},{"x":3,"y":7,"letter":" "},{"x":3,"y":8,"letter":" "},
{"x":4,"y":1,"letter":"o"},{"x":4,"y":2,"letter":" "},{"x":4,"y":3,"letter":" "},{"x":4,"y":4,"letter":" "},{"x":4,"y":5,"letter":" "},{"x":4,"y":6,"letter":" "},{"x":4,"y":7,"letter":" "},{"x":4,"y":8,"letter":" "},
{"x":5,"y":1,"letter":"b"},{"x":5,"y":2,"letter":" "},{"x":5,"y":3,"letter":" "},{"x":5,"y":4,"letter":" "},{"x":5,"y":5,"letter":" "},{"x":5,"y":6,"letter":" "},{"x":5,"y":7,"letter":" "},{"x":5,"y":8,"letter":" "},
{"x":6,"y":1,"letter":" "},{"x":6,"y":2,"letter":" "},{"x":6,"y":3,"letter":" "},{"x":6,"y":4,"letter":" "},{"x":6,"y":5,"letter":" "},{"x":6,"y":6,"letter":" "},{"x":6,"y":7,"letter":" "},{"x":6,"y":8,"letter":" "},
{"x":7,"y":1,"letter":" "},{"x":7,"y":2,"letter":" "},{"x":7,"y":3,"letter":" "},{"x":7,"y":4,"letter":" "},{"x":7,"y":5,"letter":" "},{"x":7,"y":6,"letter":" "},{"x":7,"y":7,"letter":" "},{"x":7,"y":8,"letter":" "},
{"x":8,"y":1,"letter":"x"},{"x":8,"y":2,"letter":"x"},{"x":8,"y":3,"letter":"x"},{"x":8,"y":4,"letter":"x"},{"x":8,"y":5,"letter":"x"},{"x":8,"y":6,"letter":"x"},{"x":8,"y":7,"letter":"x"},{"x":8,"y":8,"letter":"x"}]



def puzzlesplitter(board)
  tempboard = []
    xcounter = 1
  8.times do |countcols|
    outputarr = []
    ycounter = 1
    board.each do |collect|
      if collect[:x] == xcounter && collect[:y] == ycounter
        if ("a".."z").include?(collect[:letter])
          outputarr.push collect[:letter]
        end
        ycounter += 1
      end
    end
    tempboard.push outputarr
    xcounter += 1
  end
  return tempboard
end

def neighbormover(spacehash,board)
  neighborx = spacehash[:x]
  neighbory = spacehash[:y]+1
  space = board.select { |num| num[:x] == spacehash[:x] && num[:y] == spacehash[:y]}
  neighbor = board.select { |num| num[:x] == neighborx && num[:y] == neighbory}
  if neighbor[][:letter] == []
    return fail
  elsif neighbor[:letter] == " "
    space[:letter] = spacehash[:letter]
  else
    neighbormover([neighbor[0][:x], neighbor[0][:y]],board)
    space[:letter] = spacehash[:letter]
  end
  return [neighbor[0][:x], neighbor[0][:y]]
end

def firstletterinsert(letter,board)
  columns = puzzlesplitter(board)
  arrlen = 8
  until arrlen < 8 do
    arrayselect = rand(0..7)
    targetarr = columns[arrayselect]
    arrlen = targetarr.length
  end
  insertindex = rand(0..arrlen)
  targetarr.insert(insertindex, letter)
  yindex = ((8 - targetarr.length) + insertindex)
  columns[arrayselect] = targetarr
  previous = [(arrayselect+1),yindex]
  columns.each do |addblank|
    (8 - addblank.length).times do |fillarr|
      addblank.push " "
    end
  end
  columnwriter(columns,board)
  return previous
end

def remainingletterinsert(letter,board,previous)
  binding.pry
  prev = Hash["x", previous[0], "y", previous[1]]
  letteradded = false
  neighbors = board.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) }
  if neighbors.include?({:x => prev[:x]-1, :y => prev[:y]-1, :letter => " "} || {:x => prev[:x]-1, :y => prev[:y]+1, :letter => " "} )
    # maybe
    return fail
  else
    while letteradded == false
      # magic goes here. alternately, might just gloss over empty column issue and build board tester instead
      # need to build map of spaces surrounding previous
      # special case where 6 or 8 spaces are blank, need to understand how to fail and re-try
      # will have to map both neighboring columns to see if blanks extend past visible area
      previous = neighbormover(neigbors.sample,board)
      # letter added get set to true
      # previous gets updated
    end
  end
  return previous
end

def columnwriter(columns, board)
  tempboard = []
  xcounter = 0
  8.times do
    ycounter = 0
    8.times do
      newhash = Hash["x", xcounter+1, "y", ycounter+1, "letter", columns[0][xcounter][ycounter]]
      tempboard.push newhash
      ycounter += 1
    end
    xcounter += 1
  end
  board = tempboard
end

word = "furry"

def machine(word,board)
  wordarr = word.split("")
  wordarr.each do |process|
    if process == wordarr[0]
      previous = firstletterinsert(process,board)
    else
      previous = remainingletterinsert(process,board,previous)
    end
  end
  return board
end

def orphancheck(board)
  # make sure no orphaned spaces
end

print machine(word,blankboard)
