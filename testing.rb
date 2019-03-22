require 'pry'

blankboard = [{"x":1,"y":1,"letter":" "},{"x":1,"y":2,"letter":" "},{"x":1,"y":3,"letter":" "},{"x":1,"y":4,"letter":" "},{"x":1,"y":5,"letter":" "},{"x":1,"y":6,"letter":" "},{"x":1,"y":7,"letter":" "},{"x":1,"y":8,"letter":" "},
{"x":2,"y":1,"letter":" "},{"x":2,"y":2,"letter":" "},{"x":2,"y":3,"letter":" "},{"x":2,"y":4,"letter":" "},{"x":2,"y":5,"letter":" "},{"x":2,"y":6,"letter":" "},{"x":2,"y":7,"letter":" "},{"x":2,"y":8,"letter":" "},
{"x":3,"y":1,"letter":" "},{"x":3,"y":2,"letter":" "},{"x":3,"y":3,"letter":" "},{"x":3,"y":4,"letter":" "},{"x":3,"y":5,"letter":" "},{"x":3,"y":6,"letter":" "},{"x":3,"y":7,"letter":" "},{"x":3,"y":8,"letter":" "},
{"x":4,"y":1,"letter":" "},{"x":4,"y":2,"letter":" "},{"x":4,"y":3,"letter":" "},{"x":4,"y":4,"letter":" "},{"x":4,"y":5,"letter":" "},{"x":4,"y":6,"letter":" "},{"x":4,"y":7,"letter":" "},{"x":4,"y":8,"letter":" "},
{"x":5,"y":1,"letter":" "},{"x":5,"y":2,"letter":" "},{"x":5,"y":3,"letter":" "},{"x":5,"y":4,"letter":" "},{"x":5,"y":5,"letter":" "},{"x":5,"y":6,"letter":" "},{"x":5,"y":7,"letter":" "},{"x":5,"y":8,"letter":" "},
{"x":6,"y":1,"letter":" "},{"x":6,"y":2,"letter":" "},{"x":6,"y":3,"letter":" "},{"x":6,"y":4,"letter":" "},{"x":6,"y":5,"letter":" "},{"x":6,"y":6,"letter":" "},{"x":6,"y":7,"letter":" "},{"x":6,"y":8,"letter":" "},
{"x":7,"y":1,"letter":" "},{"x":7,"y":2,"letter":" "},{"x":7,"y":3,"letter":" "},{"x":7,"y":4,"letter":" "},{"x":7,"y":5,"letter":" "},{"x":7,"y":6,"letter":" "},{"x":7,"y":7,"letter":" "},{"x":7,"y":8,"letter":" "},
{"x":8,"y":1,"letter":" "},{"x":8,"y":2,"letter":" "},{"x":8,"y":3,"letter":" "},{"x":8,"y":4,"letter":" "},{"x":8,"y":5,"letter":" "},{"x":8,"y":6,"letter":" "},{"x":8,"y":7,"letter":" "},{"x":8,"y":8,"letter":" "}]

testwords = ["responsibility", "position", "eastern", "search", "monkey", "media", "photo", "chief", "than", "nose"]

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

def fullcol(board)
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
    if outputarr.length == 8
      tempboard.push xcounter
    end
    xcounter += 1
  end
  return tempboard
end

def spacereduce(neighbors)
  puts " here is neighbors inside of spacereduce #{neighbors}"
  returnarray = []
  xval = 0
  8.times do |bim|
    temparray = []
    xval += 1
    yval = 0
    punt = 0
    8.times do |bap|
      yval += 1
      neighbors.each do |putz|
        if punt == 1
          break
        end
        if putz[:x] == xval && putz[:y] == yval
          temparray.push putz
          if putz[:letter] == " "
            punt = 1
            break
          end
        end
      end
    end
    unless temparray == []
      temparray.each do |add|
        returnarray.push add
      end
    end
  end
  return returnarray
end

def removeprevious(neighbors,previous,board)
  puts " here is neighbors inside of removeprevious- #{neighbors}"
  puts " here is previous inside of removeprevious #{previous}"
  prevarray = []
  previous.each do |add|
    item = board.select { |num| num[:x] == add[0] && num[:y] == add[1]}
    prevarray.push Hash[item[0]]
  end
  prevarray.each do |moosh|
    id = neighbors.index(moosh)
    unless id == nil
      neighbors = neighbors.delete_at(id)
    end
  end
  puts " here is neighbors #{neighbors}"
  return neighbors
end

def neighbormover(candidate,letter,board,previous)
  neighborx = candidate[:x]
  neighbory = candidate[:y]+1
  candidatehash = board.select { |num| num[:x] == candidate[:x] && num[:y] == candidate[:y]}
  neighbor = board.select { |num| num[:x] == neighborx && num[:y] == neighbory}
  if candidatehash[0][:letter] == " "
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        puts "found a blank, placed #{letter}"
        overwrite[:letter] = letter
      end
    end
  elsif neighbor.length == 0
      puts "neighbormover letter placement failed on candidate: #{candidatehash} , neighbor: #{neighbor}"
      return false
  elsif previous.include?([neighbor[0][:x],neighbor[0][:y]])
    puts "neighbormover letter placement neighbor is a previous: #{candidatehash} , neighbor: #{neighbor}"
    return false
  else
    nhash = Hash[ :x, neighbor[0][:x], :y, neighbor[0][:y] ]
    puts "found *not blank*, moving neighbor #{neighbor[0][:letter]} using #{nhash}"
    neighbormover(nhash,candidatehash[0][:letter],board,previous)
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        overwrite[:letter] = letter
      end
    end
  end
  return [candidatehash[0][:x], candidatehash[0][:y]],board
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
  yindex = (insertindex + 1)
  columns[arrayselect] = targetarr
  previous = [(arrayselect+1),yindex]
  columns.each do |addblank|
    (8 - addblank.length).times do |fillarr|
      addblank.push " "
    end
  end
  result = columnwriter(columns,board)
  unless result == nil
    board = result
  end
  return previous, board
end

def remainingletterinsert(letter,board,previous)
  prev = Hash[:x, previous[-1][0], :y, previous[-1][1]]
  letteradded = false
  neighbors = board.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) }
  if neighbors.is_a?(Hash)
    puts "CRAP!"
    binding.pry
  end
  nofly = fullcol(board)
  puts " here is neighbors before nofly #{neighbors}"
  # if nofly.length > 0
  #   if neighbors.is_a?(Hash)
  #     temparr = []
  #     neighbors = temparr.push neighbors
  #   end
  #   neighbors.each do |removefull|
  #     if nofly.include?(removefull[:x])
  #       id = neighbors.index(removefull)
  #       neighbors = neighbors.delete_at(id)
  #     end
  #   end
  # end
  puts " here is neighbors after nofly #{neighbors}"
  if neighbors.is_a?(Hash)
    temparray = []
    neighbors = temparray.push neighbors
    puts " had to make neighbors into an array WOOOOT\n\n\n"
  end
  neighbors = spacereduce(neighbors)
  puts " here is neighbors after spacereduce #{neighbors}"
  neighbors = removeprevious(neighbors,previous,board)
  puts " here is neighbors after removeprevious #{neighbors}"
  if neighbors.include?( {:x => (prev[:x]-1), :y => (prev[:y]-1), :letter => " "} ) && neighbors.include?( {:x => (prev[:x]-1), :y => (prev[:y]+1), :letter => " "} )
    puts "remainingletterinsert letter placement failed on blank neighbor check, letter: #{letter}, previous: #{previous[-1]}"
    return false
  elsif neighbors.length == 0
    puts "neighbors was zero length"
    return false
  else
    if neighbors.is_a?(Hash)
      result = neighbormover(neighbors,letter,board,previous)
    else
      result = neighbormover(neighbors.sample,letter,board,previous)
    end
  end
  if result == false
    return false
  else
    previous = result[0]
    board = result[1]
    return previous, board
  end

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

def outputviewer(board)
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

def machine(word,board)
  resultboard = board.clone
  previous = []
  wordarr = word.split("")
  counter = 0
  wordarr.each do |process|
    if counter == 0
      result = firstletterinsert(process,resultboard)
      unless result == false
        previous.push result[0]
        resultboard = result[1]
      end
    else
      result = remainingletterinsert(process,resultboard,previous)
      unless result == false
        previous.push result[0]
        resultboard = result[1]
      end
    end
    board = resultboard
    if result == false
      return false
    end
    outputviewer(resultboard)
    counter += 1
  end
  return resultboard, previous
end

def orphancheck(board)
  # make sure no orphaned spaces
end

gameboard = blankboard.clone
solution = []
words = []
testwords.each do |place|
  20.times do
    printing = machine(place,gameboard)
    if printing == false
      puts "an attempt to run machine failed"
    else
      print printing[0]
      gameboard = printing[0]
      solution.push printing[1]
      words.push place
      break
    end
  end
end
puts " "
print solution
puts " "
print words
