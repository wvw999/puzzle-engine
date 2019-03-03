require('benchmark')

# testboard = [{"x":1,"y":1,"letter":"y"},{"x":1,"y":2,"letter":"t"},{"x":1,"y":3,"letter":"i"},{"x":1,"y":4,"letter":"l"},{"x":1,"y":5,"letter":"n"},{"x":1,"y":6,"letter":"e"},{"x":1,"y":7,"letter":"c"},{"x":1,"y":8,"letter":"h"},
# {"x":2,"y":1,"letter":"f"},{"x":2,"y":2,"letter":"e"},{"x":2,"y":3,"letter":"i"},{"x":2,"y":4,"letter":"i"},{"x":2,"y":5,"letter":"r"},{"x":2,"y":6,"letter":"t"},{"x":2,"y":7,"letter":"s"},{"x":2,"y":8,"letter":"a"},
# {"x":3,"y":1,"letter":"e"},{"x":3,"y":2,"letter":"o"},{"x":3,"y":3,"letter":"b"},{"x":3,"y":4,"letter":"n"},{"x":3,"y":5,"letter":"o"},{"x":3,"y":6,"letter":"i"},{"x":3,"y":7,"letter":"o"},{"x":3,"y":8,"letter":"e"},
# {"x":4,"y":1,"letter":"t"},{"x":4,"y":2,"letter":"i"},{"x":4,"y":3,"letter":"s"},{"x":4,"y":4,"letter":"n"},{"x":4,"y":5,"letter":"o"},{"x":4,"y":6,"letter":"p"},{"x":4,"y":7,"letter":"t"},{"x":4,"y":8,"letter":"s"},
# {"x":5,"y":1,"letter":"m"},{"x":5,"y":2,"letter":"o"},{"x":5,"y":3,"letter":"h"},{"x":5,"y":4,"letter":"n"},{"x":5,"y":5,"letter":"m"},{"x":5,"y":6,"letter":"s"},{"x":5,"y":7,"letter":"r"},{"x":5,"y":8,"letter":"i"},
# {"x":6,"y":1,"letter":"o"},{"x":6,"y":2,"letter":"n"},{"x":6,"y":3,"letter":"p"},{"x":6,"y":4,"letter":"c"},{"x":6,"y":5,"letter":"a"},{"x":6,"y":6,"letter":"e"},{"x":6,"y":7,"letter":"e"},{"x":6,"y":8,"letter":"s"},
# {"x":7,"y":1,"letter":"k"},{"x":7,"y":2,"letter":"s"},{"x":7,"y":3,"letter":"r"},{"x":7,"y":4,"letter":"n"},{"x":7,"y":5,"letter":"h"},{"x":7,"y":6,"letter":"i"},{"x":7,"y":7,"letter":"d"},{"x":7,"y":8,"letter":"o"},
# {"x":8,"y":1,"letter":"e"},{"x":8,"y":2,"letter":"a"},{"x":8,"y":3,"letter":"e"},{"x":8,"y":4,"letter":"y"},{"x":8,"y":5,"letter":"a"},{"x":8,"y":6,"letter":"t"},{"x":8,"y":7,"letter":"h"},{"x":8,"y":8,"letter":"p"}]

testboard = [{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
{"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
{"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
{"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
{"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
{"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
{"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
{"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"z"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]





#
# testwords = ["responsibility", "position", "eastern", "search", "monkey", "media", "photo", "chief", "than", "nose"]
#

sampleword = "snakes"

samplewordarray = sampleword.split('').to_a
word_len = sampleword.length
alllocations = []
individuallocation = []
samplewordarray.each do |build|
  testboard.each do |compare|
    if compare[:letter] === build
      j = compare[:x]
      k = compare[:y]
      individuallocation.push [j,k]
    end
  end
  alllocations.push individuallocation
  individuallocation = []
end

def sentence_maker(input)
  input.reduce([]) do |memo, value|
    value.reduce([]) do |m, new_word|
      if memo.count > 0
        memo.map do |prev_words|
          [*prev_words, new_word]
        end + m
      else
        [[new_word]]
      end
    end
  end
end

print sentence_maker(alllocations)#.map {|x| x.join(" ") }.sort

# set of possible locations of word passed here
# checks to see if pairs of values are contiguous board spaces
# retains if so

proofed_list = []
permuted.each do |process|
  process.each do |arrayy|
    print arrayy
    indexofsolution = 0
    failed = 0
    (word_len-1).times do |checkpairs|
      first = arrayy[indexofsolution]
      second = arrayy[indexofsolution+1]
      xlist = [first[-2], first[-2]-1, first[-2]+1]
      ylist = [first[-1], first[-1]-1, first[-1]+1]
      if xlist.include?(second[0]) && ylist.include?(second[1])
        failed = 0
      else
        puts "huh"
        failed += 1
      end
      indexofsolution += 1
    end
    indexofsolution = 0
    if failed == 0
      print arrayy
      proofed_list.push arrayy
    end
    failed = 0
  end
end

print proofed_list

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

# step 1 - generate permutation list of words on board
  # note: will run this manually without permutation list first.
    # permutationlist = testwords.permutation.to_a
    # print permutationlist

# step 2 - grab first value in list of permutations, grab first word in list

    # step 3 - build permutations list of letters in first word

    # step 4 - filter all non-contiguous entries in list, fail if no remaining entries

    # step 5 - re-draw board after removing a word

# repeat steps 3, 4, 5, return true if able to complete list, otherwise fail and return to step 2

# puts Benchmark.measure {
#   puts sentence_maker(input).map{|x| x.join(" ") }.sort
# }
