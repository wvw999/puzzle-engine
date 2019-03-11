testboard = [["1","1","t"],["1","2","e"],["1","3","d"],["1","4","h"],["1","5","c"],["1","6","t"],["1","7","i"],["1","8","r"],["2","1","l"],["2","2","o"],["2","3","n"],["2","4","e"],["2","5","c"],["2","6","e"],["2","7","v"],["2","8","e"],["3","1","g"],["3","2","o"],["3","3","c"],["3","4","e"],["3","5","d"],["3","6","b"],["3","7","t"],["3","8","e"],["4","1","y"],["4","2","e"],["4","3","n"],["4","4","k"],["4","5","t"],["4","6","e"],["4","7","a"],["4","8","c"],["5","1","d"],["5","2","b"],["5","3","t"],["5","4","p"],["5","5","s"],["5","6","l"],["5","7","l"],["5","8","o"],["6","1","o"],["6","2","n"],["6","3","e"],["6","4","y"],["6","5","a"],["6","6","l"],["6","7","a"],["6","8","s"],["7","1","d"],["7","2","a"],["7","3","d"],["7","4","b"],["7","5","a"],["7","6","s"],["7","7","p"],["7","8","m"],["8","1","l"],["8","2","o"],["8","3","r"],["8","4","f"],["8","5","a"],["8","6","m"],["8","7","e"],["8","8","l"]]

testwords = ["technology","basketball","detective","dependent","soccer","sample","board","malay","fold"]

wordspermuted = testwords.permutation.to_a

wordsindex = 1
solutionfound = false

until wordsindex == wordspermuted.length || solutionfound == true do |looptosolve|
  # call block to look permute array word

  # call block to permuted = word_permuter(alllocations)


end


samplewordarray = sampleword.split('').to_a
word_len = sampleword.length
alllocations = []
individuallocation = []
samplewordarray.each do |build|
  testboard.each do |compare|
    if compare[2] === build
      j = compare[0]
      k = compare[1]
      individuallocation.push [j,k]
    end
  end
  alllocations.push individuallocation
  individuallocation = []
end

puts "this is alllocations"
print alllocations
puts "\n\n\n"

def word_permuter(input)
  input.reduce([]) do |whole_calculation, new_group|

    if whole_calculation.count == 0
      new_group.map { |x| [x] }
    else
      whole_calculation.reduce([]) do |sub_calculation, single_sentence|
        new_group.map do |new_word|
          single_sentence + [new_word]
        end + sub_calculation
      end
    end
  end
end


#.map {|x| x.join(" ") }.sort
# set of possible locations of word passed here
# checks to see if pairs of values are contiguous board spaces
# based on +/- 1 x/y values
# retains instance from permuted list if so

def listproofer(list)
  proofed_list = []
  list.each do |process|
      indexofsolution = 0
      failed = 0
      (word_len-1).times do |checkpairs|
        first = process[indexofsolution]
        second = process[indexofsolution+1]
        xlist = [first[-2], first[-2]-1, first[-2]+1]
        ylist = [first[-1], first[-1]-1, first[-1]+1]
        if xlist.include?(second[0]) && ylist.include?(second[1])
          a = 1
        else
          failed += 1
        end
        indexofsolution += 1
      end
      indexofsolution = 0
      if failed == 0
        # print process
        # puts " "
        proofed_list.push process
      else
        puts "boo"
      end
      failed = 0
  end
  return proofed_list
end

 # call after removing word from board

def puzzleupdate(board)
  tempboard = []
  print testboard
    xcounter = 1
  8.times do |countcols|
    outputarr = []
    ycounter = 1
    board.each do |collect|
      if collect[0].to_i == xcounter && collect[1].to_i == ycounter
        if ("a".."z").include?(collect[2])
          outputarr.push collect[2]
        end
        ycounter += 1
      end
    end
    (8 - outputarr.length).times do |addblank|
      outputarr.push " "
    end
    print outputarr
    xcounter += 1
  end
end


# below needs update to use with current DB puzzle storage scheme

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
