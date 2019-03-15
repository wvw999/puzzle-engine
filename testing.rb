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

def valid_space_gatherer(board)
  tempboard = []
  xcounter = 1
  8.times do |countcols|
    outputarr = []
    ycounter = 1
    previousblank = 0
    8.times do |collect|
      norton = board.select { |num| num[:x] == xcounter && num[:y] == ycounter}
      # puts " x #{xcounter}, y #{ycounter}, previousblank #{previousblank}, norton, #{norton}, letter \"#{norton[0][:letter]}\""
      if previousblank == 0
        outputarr.push norton[0]
      end
      if norton[0][:letter] == " "
        previousblank = 1
      end
      ycounter += 1
    end
    previousblank = 0
    bobbert = outputarr.select { |space| space[:letter] == " "}
    if bobbert != []
      outputarr.each do |adding|
        tempboard.push adding
      end
    end
    xcounter += 1
  end
  return tempboard
end

# need to mod this to push a letter into the output arr, and also to grab its index, and also to remember the index and pass it back to the request
# instead, mod this to make an array of arrays- one for each column on the board, arrays have letters only
# use .length to pick an array, check to make sure it has a blank space in it,
# then use
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

def firstletterinsert(letter,board)
  columns = puzzlesplitter(board)
  while previous == []
    arrayselect = rand(0..7)
    targetarr = columns[arrayselect]
    arrlen = targetarr.length
    if arrlen > 7
      previous = []
    else
      insertindex = rand(0..arrlen)
      targetarr.insert(insertindex, letter)
      yindex = ((8 - targetarr.length) + insertindex)
      columns[arrayselect] = targetarr
      previous = [(arrayselect+1),yindex]
    end
  end
    # do the subsequent letters stuff here
    # prevxindex = previous[0]
    # prevyindex = previous[1]
    # targetarr = columns[prevxindex]
  columns.each do |addblank|
    (8 - addblank.length).times do |fillarr|
      addblank.push " "
    end
  end
  columnwriter(columns,board)
  return previous
end

def remainingletterinsert(letter,board,previous)
  columns = puzzlesplitter(board)
  prevxindex = previous[0]
  prevyindex = previous[1]
  letteradded = false
  while letteradded = false
    #magic goes here
  end
  columnwriter(columns, board)
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
      sausage = firstletterinsert(letter),board)
    else
      biscuit = remainingletterinsert(letter,blankboard,sausage)
    end
  end
return board
end

machine(word,blankboard)

# def letteradder(word, board)
#   prev = " "
#   word.each do |placeletter|
#     partial = valid_space_gatherer(board)
#     if prev == " "
#       data = partial.sample
#       if data[:letter] != " "
#         neighbor = board.select { |num| num[:x] == data[:x] && num[:y] == (data[:y] + 1) }
#         neighbor[0][:letter] = data[:letter]
#       end
#     else
#       # this ugly mess locates all spaces surrounding the previous letter
#       prevneighbor = partial.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) }
#       # this grabs a neighboring space from the prevneighbor array
#       data = prevneighbor.sample
#       if data[:letter] != " "
#         neighbor = board.select { |num| num[:x] == data[:x] && num[:y] == (data[:y] + 1) }
#         neighbor[0][:letter] = data[:letter]
#       end
#     end
#     exact = board.select { |num| num[:x] == data[:x] && num[:y] == data[:y] }
#     exact[0][:letter] = placeletter
#     prev = Hash[x, data[:x], y, data[:y], letter, placeletter]
#   end
# end

# testing = valid_space_gatherer(blankboard)
# letteradder("f", testing, blankboard, prevletter)
# # need to update main board with completed letter from letteradder
# print blankboard.select { |num| num[:letter] == "f" }



# testboard = [["1","1"," "],["1","2","e"],["1","3","t"],["1","4","n"],["1","5","e"],["1","6","c"],["1","7","s"],["1","8","i"],["2","1","a"],["2","2","i"],["2","3"," "],["2","4","m"],["2","5","o"],["2","6","d"],["2","7","p"],["2","8","e"],["3","1","l"],["3","2","r"],["3","3","e"],["3","4","n"],["3","5","y"],["3","6","r"],["3","7","r"],["3","8","a"],["4","1","v"],["4","2","n"],["4","3","a"],["4","4","s"],["4","5","m"],["4","6","a"],["4","7","a"],["4","8","n"],["5","1","g"],["5","2","a"],["5","3","i"],["5","4","e"],["5","5","u"],["5","6","m"],["5","7","r"],["5","8","o"],["6","1","u"],["6","2","d"],["6","3","t"],["6","4","v"],["6","5","e"],["6","6","s"],["6","7","m"],["6","8","u"],["7","1","e"],["7","2","n"],["7","3","r"],["7","4","d"],["7","5","e"],["7","6","c"],["7","7","n"],["7","8","l"],["8","1","v"],["8","2","o"],["8","3","b"],["8","4","i"],["8","5","r"],["8","6","d"],["8","7","i"],["8","8","s"]]

# older code, hiding
#
# sampleword = "snakes"
#
# def word_letter_lookup(word,board)
#   samplewordarray = sampleword.split('').to_a
#   word_len = sampleword.length
#   alllocations = []
#   individuallocation = []
#   samplewordarray.each do |build|
#     testboard.each do |compare|
#       if compare[2] === build
#         j = compare[0]
#         k = compare[1]
#         individuallocation.push [j,k]
#       end
#     end
#     alllocations.push individuallocation
#     individuallocation = []
#   end
# end
#
# def wordremover(xyset, board)
#   xyset.each do |removeletter|
#     board.each do |checkcoords|
#       # if xy vals match, change space to blank
#     end
#   end
# end
#
#
# def puzzleupdater(board)
#   tempboard = []
#   print testboard
#     xcounter = 1
#   8.times do |countcols|
#     outputarr = []
#     ycounter = 1
#     board.each do |collect|
#       if collect[0].to_i == xcounter && collect[1].to_i == ycounter
#         if ("a".."z").include?(collect[2])
#           outputarr.push collect[2]
#         end
#         ycounter += 1
#       end
#     end
#     (8 - outputarr.length).times do |addblank|
#       outputarr.push " "
#     end
#     print outputarr
#     xcounter += 1
#   end
# end
#
# def word_permuter(input)
#   input.reduce([]) do |whole_calculation, new_group|
#
#     if whole_calculation.count == 0
#       new_group.map { |x| [x] }
#     else
#       whole_calculation.reduce([]) do |sub_calculation, single_sentence|
#         new_group.map do |new_word|
#           single_sentence + [new_word]
#         end + sub_calculation
#       end
#     end
#   end
# end
#
# def wordlistproofer
#   proofed_list = []
#   permuted.each do |process|
#       indexofsolution = 0
#       failed = 0
#       (word_len-1).times do |checkpairs|
#         first = process[indexofsolution]
#         second = process[indexofsolution+1]
#         xlist = [first[-2], first[-2]-1, first[-2]+1]
#         ylist = [first[-1], first[-1]-1, first[-1]+1]
#         if xlist.include?(second[0]) && ylist.include?(second[1])
#           a = 1
#         else
#           failed += 1
#         end
#         indexofsolution += 1
#       end
#       indexofsolution = 0
#       if failed == 0
#         # print process
#         # puts " "
#         proofed_list.push process
#       else
#         puts "boo"
#       end
#       failed = 0
#   end
# end
