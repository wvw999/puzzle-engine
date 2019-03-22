require 'pry'

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



def neighbormover(candidate,letter,board)
  neighborx = candidate[:x]
  neighbory = candidate[:y]+1
  candidatehash = board.select { |num| num[:x] == candidate[:x] && num[:y] == candidate[:y]}
  neighbor = board.select { |num| num[:x] == neighborx && num[:y] == neighbory}
  if candidatehash[0][:letter] == " "
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        # binding.pry
        overwrite[:letter] = letter
      end
    end
  elsif neighbor.length == 0
      puts "neighbormover letter placement failed on candidate: #{candidatehash} , neighbor: #{neighbor}"
      return false
  else
    nhash = Hash[ :x, neighbor[0][:x], :y, neighbor[0][:y] ]
    neighbormover(nhash,neighbor[0][:letter],board)
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        # binding.pry
        overwrite[:letter] = candidate[:letter]
      end
    end
  end
  return [candidatehash[0][:x], candidatehash[0][:y]],board
end

def firstletterinsert(letter,board)
  columns = puzzlesplitter(board)
  #binding.pry
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
  # binding.pry
  return previous, board
end

def remainingletterinsert(letter,board,previous)
  prev = Hash[:x, previous[0], :y, previous[1]]
  letteradded = false
  neighbors = board.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) }
  nofly = fullcol(board)
  if nofly.length > 0
    neighbors.each do |removefull|
      if nofly.include?(removefull[:x])
        neighbors.delete removefull
      end
    end
  end
  if neighbors.include?({:x => prev[:x]-1, :y => prev[:y]-1, :letter => " "} || {:x => prev[:x]-1, :y => prev[:y]+1, :letter => " "} )
    puts "remainingletterinsert letter placement failed for letter: #{letter}, previous: #{previous}"
    return false
  elsif neighbors.length == 0
    puts "neighbors was zero length"
    return false
  else
    result = neighbormover(neighbors.sample,letter,board)
    unless result == false
      previous = result[0]
      board = result[1]
    end
  end
  return previous, board
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

word = "furry"

def machine(word,board)
  resultboard = board.clone
  wordarr = word.split("")
  counter = 0
  previous = []
  wordarr.each do |process|
    if counter == 0
      result = firstletterinsert(process,resultboard)
      unless result == false
        previous = result[0]
        resultboard = result[1]
      end
    else
      result = remainingletterinsert(process,resultboard,previous)
      unless result == false
        previous = result[0]
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
  return resultboard
end

def orphancheck(board)
  # make sure no orphaned spaces
end

20.times do
  printing = machine(word,blankboard)
  if printing == false
    puts "an attempt to run machine failed"
  else
    print printing
    break
  end
end
