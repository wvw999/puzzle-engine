

# toot = [{:x=>6, :y=>1, :letter=>" "}, {:x=>6, :y=>2, :letter=>" "}, {:x=>7, :y=>2, :letter=>" "}, {:x=>8, :y=>2, :letter=>"x"}]
#
# toot = toot.reject { |num| num[:x] == 8}
#
# print toot

gameboard = [{:x=>1, :y=>1, :letter=>"b"}, {:x=>1, :y=>2, :letter=>"a"}, {:x=>1, :y=>3, :letter=>"r"}, {:x=>1, :y=>4, :letter=>"n"}, {:x=>1, :y=>5, :letter=>"s"}, {:x=>1, :y=>6, :letter=>"e"}, {:x=>1, :y=>7, :letter=>"t"}, {:x=>1, :y=>8, :letter=>"a"}, {:x=>2, :y=>1, :letter=>"w"}, {:x=>2, :y=>2, :letter=>"o"}, {:x=>2, :y=>3, :letter=>"i"}, {:x=>2, :y=>4, :letter=>"l"}, {:x=>2, :y=>5, :letter=>"e"}, {:x=>2, :y=>6, :letter=>"r"}, {:x=>2, :y=>7, :letter=>"r"}, {:x=>2, :y=>8, :letter=>"t"}, {:x=>3, :y=>1, :letter=>"l"}, {:x=>3, :y=>2, :letter=>"n"}, {:x=>3, :y=>3, :letter=>"n"}, {:x=>3, :y=>4, :letter=>"t"}, {:x=>3, :y=>5, :letter=>"r"}, {:x=>3, :y=>6, :letter=>"p"}, {:x=>3, :y=>7, :letter=>"i"}, {:x=>3, :y=>8, :letter=>"b"}, {:x=>4, :y=>1, :letter=>"o"}, {:x=>4, :y=>2, :letter=>"t"}, {:x=>4, :y=>3, :letter=>"y"}, {:x=>4, :y=>4, :letter=>"i"}, {:x=>4, :y=>5, :letter=>"u"}, {:x=>4, :y=>6, :letter=>"y"}, {:x=>4, :y=>7, :letter=>"o"}, {:x=>4, :y=>8, :letter=>"n"}, {:x=>5, :y=>1, :letter=>"c"}, {:x=>5, :y=>2, :letter=>"i"}, {:x=>5, :y=>3, :letter=>"r"}, {:x=>5, :y=>4, :letter=>"t"}, {:x=>5, :y=>5, :letter=>"b"}, {:x=>5, :y=>6, :letter=>"i"}, {:x=>5, :y=>7, :letter=>"t"}, {:x=>5, :y=>8, :letter=>"k"}, {:x=>6, :y=>1, :letter=>"b"}, {:x=>6, :y=>2, :letter=>"o"}, {:x=>6, :y=>3, :letter=>"e"}, {:x=>6, :y=>4, :letter=>"i"}, {:x=>6, :y=>5, :letter=>"l"}, {:x=>6, :y=>6, :letter=>"s"}, {:x=>6, :y=>7, :letter=>"o"}, {:x=>6, :y=>8, :letter=>"n"}, {:x=>7, :y=>1, :letter=>"o"}, {:x=>7, :y=>2, :letter=>"e"}, {:x=>7, :y=>3, :letter=>"h"}, {:x=>7, :y=>4, :letter=>"t"}, {:x=>7, :y=>5, :letter=>"b"}, {:x=>7, :y=>6, :letter=>"e"}, {:x=>7, :y=>7, :letter=>"h"}, {:x=>7, :y=>8, :letter=>"p"}, {:x=>8, :y=>1, :letter=>"a"}, {:x=>8, :y=>2, :letter=>"t"}, {:x=>8, :y=>3, :letter=>"u"}, {:x=>8, :y=>4, :letter=>"c"}, {:x=>8, :y=>5, :letter=>"o"}, {:x=>8, :y=>6, :letter=>"l"}, {:x=>8, :y=>7, :letter=>"h"}, {:x=>8, :y=>8, :letter=>"e"}]
solution = [[[6, 1], [7, 1], [8, 1], [8, 2], [8, 3]], [[1, 1], [1, 2], [1, 3], [1, 4]], [[1, 5], [2, 4], [2, 3], [2, 2], [3, 1], [4, 1]], [[5, 1], [4, 1], [3, 2], [4, 2], [3, 3], [4, 4], [3, 4], [4, 5], [5, 4], [5, 3], [6, 2], [6, 3]], [[7, 1], [8, 2], [7, 3], [6, 3], [5, 3]], [[7, 4], [8, 4], [7, 5], [8, 6]], [[2, 3], [3, 3], [3, 4], [2, 5], [2, 6], [3, 6], [2, 7], [1, 6], [1, 7], [1, 8], [2, 8], [3, 7], [4, 6], [4, 7]], [[7, 4], [8, 5], [7, 5], [6, 4], [5, 5], [6, 5], [5, 6]], [[8, 3], [7, 4], [6, 4], [6, 5], [5, 6], [5, 7], [4, 6]]]
words = ["beach", "barn", "slowly", "contribution", "other", "hope", "interpretation", "blesbok", "utility"]

puts " "
print gameboard
puts " "
print solution
puts " "
print words
finishedboard = []
gameboard.each do |jerkface|
  temparr = []
  temparr.push jerkface[:x]
  temparr.push jerkface[:y]
  temparr.push jerkface[:letter]
  finishedboard.push temparr
end
solved = Marshal.dump(solution)
puzzle = Puzzle.new(:board => finishedboard, :words => words, :solution => solved).save

# testboard = [["1","1","t"],["1","2","e"],["1","3","d"],["1","4","h"],["1","5","c"],["1","6","t"],["1","7","i"],["1","8","r"],["2","1","l"],["2","2","o"],["2","3","n"],["2","4","e"],["2","5","c"],["2","6","e"],["2","7","v"],["2","8","e"],["3","1","g"],["3","2","o"],["3","3","c"],["3","4","e"],["3","5","d"],["3","6","b"],["3","7","t"],["3","8","e"],["4","1","y"],["4","2","e"],["4","3","n"],["4","4","k"],["4","5","t"],["4","6","e"],["4","7","a"],["4","8","c"],["5","1","d"],["5","2","b"],["5","3","t"],["5","4","p"],["5","5","s"],["5","6","l"],["5","7","l"],["5","8","o"],["6","1","o"],["6","2","n"],["6","3","e"],["6","4","y"],["6","5","a"],["6","6","l"],["6","7","a"],["6","8","s"],["7","1","d"],["7","2","a"],["7","3","d"],["7","4","b"],["7","5","a"],["7","6","s"],["7","7","p"],["7","8","m"],["8","1","l"],["8","2","o"],["8","3","r"],["8","4","f"],["8","5","a"],["8","6","m"],["8","7","e"],["8","8","l"]]
#
# testwords = ["technology","basketball","detective","dependent","soccer","sample","board","malay","fold"]
#
#
#
# # will need to add process to remove words from board
#   # this will need to use the coords built and used by the permute method
# # also will need to remove "found" words from "words on board" storage area
# # which of course is not defined by the above data
#
# def solution_processor
#   wordspermuted = testwords.permutation.to_a
#   wordarraylength = testwords.length
#   wordsindex = 1
#   solutionfound = false
#   tempboard = testboard.clone
#   until wordsindex == wordspermuted.length || solutionfound == true
#     current = wordspermuted[wordsindex]
#     currentfail = false
#     while currentfail == false || solutionfound == false
#       attemptindex = 0
#       wordarraylength.times do |checkeachword|
#         xyletters = word_letter_lookup(current[attemptindex], testboard)
#         if xyletters == false
#           currentfail == true
#           break
#         else
#           permutedword = word_permuter(xyletters)
#           proofedlist = wordlistproofer(permutedwords)
#           attemptindex += 1
#         end
#
#       end
#     end
#     wordsindex += 1
#   end
# end
#
#
#
# # builds array of all xy vals for all letters in a word
# def word_letter_lookup(word,board)
#   samplewordarray = word.split('').to_a
#   word_len = word.length
#   alllocations = []
#   individuallocation = []
#   samplewordarray.each do |build|
#     board.each do |compare|
#       if compare[2] === build
#         j = compare[0]
#         k = compare[1]
#         individuallocation.push [j,k]
#       end
#     end
#     alllocations.push individuallocation
#     individuallocation = []
#   end
#   if alllocations == []
#     return false
#   else
#     return alllocations
#   end
# end
#
# # builds an array of arrays of all possible permutations
# # of letters assembled by word_letter_lookup
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
# def wordlistproofer(list)
#   proofed_list = []
#   list.each do |process|
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
#   return proofed_list
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
# def puzzleupdate(board)
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
#
# # below needs update to use with current DB puzzle storage scheme
#
# # this block draws out a sample board for preview in html
# # cannot just read board directly because board is initial value x1y1 is in lower left instead of upper left
#
# # @x = 1
# # @y = 8
# # 64.times do |print|
# #   testboard.each do |web|
# #     if web[:x].to_i === @x
# #       if web[:y].to_i === @y
# #         print "<td> "
# #         print web[:letter]
# #         print " </td>"
# #       end
# #     end
# #   end
# #   if @x == 8
# #     @x = 1
# #     @y -= 1
# #   else
# #     @x += 1
# #   end
# # end
#
#
#
# # def valid_space_gatherer(board)
# #   tempboard = []
# #   xcounter = 1
# #   8.times do |countcols|
# #     outputarr = []
# #     ycounter = 1
# #     previousblank = 0
# #     8.times do |collect|
# #       norton = board.select { |num| num[:x] == xcounter && num[:y] == ycounter}
# #       # puts " x #{xcounter}, y #{ycounter}, previousblank #{previousblank}, norton, #{norton}, letter \"#{norton[0][:letter]}\""
# #       if previousblank == 0
# #         outputarr.push norton[0]
# #       end
# #       if norton[0][:letter] == " "
# #         previousblank = 1
# #       end
# #       ycounter += 1
# #     end
# #     previousblank = 0
# #     bobbert = outputarr.select { |space| space[:letter] == " "}
# #     if bobbert != []
# #       outputarr.each do |adding|
# #         tempboard.push adding
# #       end
# #     end
# #     xcounter += 1
# #   end
# #   return tempboard
# # end
#
# # def letteradder(word, board)
# #   prev = " "
# #   word.each do |placeletter|
# #     partial = valid_space_gatherer(board)
# #     if prev == " "
# #       data = partial.sample
# #       if data[:letter] != " "
# #         neighbor = board.select { |num| num[:x] == data[:x] && num[:y] == (data[:y] + 1) }
# #         neighbor[0][:letter] = data[:letter]
# #       end
# #     else
# #       # this ugly mess locates all spaces surrounding the previous letter
# #       prevneighbor = partial.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) }
# #       # this grabs a neighboring space from the prevneighbor array
# #       data = prevneighbor.sample
# #       if data[:letter] != " "
# #         neighbor = board.select { |num| num[:x] == data[:x] && num[:y] == (data[:y] + 1) }
# #         neighbor[0][:letter] = data[:letter]
# #       end
# #     end
# #     exact = board.select { |num| num[:x] == data[:x] && num[:y] == data[:y] }
# #     exact[0][:letter] = placeletter
# #     prev = Hash[x, data[:x], y, data[:y], letter, placeletter]
# #   end
# # end
#
# # testing = valid_space_gatherer(blankboard)
# # letteradder("f", testing, blankboard, prevletter)
# # # need to update main board with completed letter from letteradder
# # print blankboard.select { |num| num[:letter] == "f" }
#
#
#
# # testboard = [["1","1"," "],["1","2","e"],["1","3","t"],["1","4","n"],["1","5","e"],["1","6","c"],["1","7","s"],["1","8","i"],["2","1","a"],["2","2","i"],["2","3"," "],["2","4","m"],["2","5","o"],["2","6","d"],["2","7","p"],["2","8","e"],["3","1","l"],["3","2","r"],["3","3","e"],["3","4","n"],["3","5","y"],["3","6","r"],["3","7","r"],["3","8","a"],["4","1","v"],["4","2","n"],["4","3","a"],["4","4","s"],["4","5","m"],["4","6","a"],["4","7","a"],["4","8","n"],["5","1","g"],["5","2","a"],["5","3","i"],["5","4","e"],["5","5","u"],["5","6","m"],["5","7","r"],["5","8","o"],["6","1","u"],["6","2","d"],["6","3","t"],["6","4","v"],["6","5","e"],["6","6","s"],["6","7","m"],["6","8","u"],["7","1","e"],["7","2","n"],["7","3","r"],["7","4","d"],["7","5","e"],["7","6","c"],["7","7","n"],["7","8","l"],["8","1","v"],["8","2","o"],["8","3","b"],["8","4","i"],["8","5","r"],["8","6","d"],["8","7","i"],["8","8","s"]]
#
# # older code, hiding
# #
# # sampleword = "snakes"
# #
# # def word_letter_lookup(word,board)
# #   samplewordarray = sampleword.split('').to_a
# #   word_len = sampleword.length
# #   alllocations = []
# #   individuallocation = []
# #   samplewordarray.each do |build|
# #     testboard.each do |compare|
# #       if compare[2] === build
# #         j = compare[0]
# #         k = compare[1]
# #         individuallocation.push [j,k]
# #       end
# #     end
# #     alllocations.push individuallocation
# #     individuallocation = []
# #   end
# # end
# #
# # def wordremover(xyset, board)
# #   xyset.each do |removeletter|
# #     board.each do |checkcoords|
# #       # if xy vals match, change space to blank
# #     end
# #   end
# # end
# #
# #
# # def puzzleupdater(board)
# #   tempboard = []
# #   print testboard
# #     xcounter = 1
# #   8.times do |countcols|
# #     outputarr = []
# #     ycounter = 1
# #     board.each do |collect|
# #       if collect[0].to_i == xcounter && collect[1].to_i == ycounter
# #         if ("a".."z").include?(collect[2])
# #           outputarr.push collect[2]
# #         end
# #         ycounter += 1
# #       end
# #     end
# #     (8 - outputarr.length).times do |addblank|
# #       outputarr.push " "
# #     end
# #     print outputarr
# #     xcounter += 1
# #   end
# # end
# #
# # def word_permuter(input)
# #   input.reduce([]) do |whole_calculation, new_group|
# #
# #     if whole_calculation.count == 0
# #       new_group.map { |x| [x] }
# #     else
# #       whole_calculation.reduce([]) do |sub_calculation, single_sentence|
# #         new_group.map do |new_word|
# #           single_sentence + [new_word]
# #         end + sub_calculation
# #       end
# #     end
# #   end
# # end
# #
# # def wordlistproofer
# #   proofed_list = []
# #   permuted.each do |process|
# #       indexofsolution = 0
# #       failed = 0
# #       (word_len-1).times do |checkpairs|
# #         first = process[indexofsolution]
# #         second = process[indexofsolution+1]
# #         xlist = [first[-2], first[-2]-1, first[-2]+1]
# #         ylist = [first[-1], first[-1]-1, first[-1]+1]
# #         if xlist.include?(second[0]) && ylist.include?(second[1])
# #           a = 1
# #         else
# #           failed += 1
# #         end
# #         indexofsolution += 1
# #       end
# #       indexofsolution = 0
# #       if failed == 0
# #         # print process
# #         # puts " "
# #         proofed_list.push process
# #       else
# #         puts "boo"
# #       end
# #       failed = 0
# #   end
# # end
