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


{:x=>1, :y=>1, :letter=>" "}, {:x=>1, :y=>2, :letter=>" "}, {:x=>1, :y=>3, :letter=>" "}, {:x=>1, :y=>4, :letter=>" "}, {:x=>1, :y=>5, :letter=>" "}, {:x=>1, :y=>6, :letter=>" "}, {:x=>1, :y=>7, :letter=>" "}, {:x=>1, :y=>8, :letter=>" "}
{:x=>2, :y=>1, :letter=>" "}, {:x=>2, :y=>2, :letter=>" "}, {:x=>2, :y=>3, :letter=>" "}, {:x=>2, :y=>4, :letter=>" "}, {:x=>2, :y=>5, :letter=>" "}, {:x=>2, :y=>6, :letter=>" "}, {:x=>2, :y=>7, :letter=>" "}, {:x=>2, :y=>8, :letter=>" "}
{:x=>3, :y=>1, :letter=>"b"}, {:x=>3, :y=>2, :letter=>"u"}, {:x=>3, :y=>3, :letter=>" "}, {:x=>3, :y=>4, :letter=>" "}, {:x=>3, :y=>5, :letter=>" "}, {:x=>3, :y=>6, :letter=>" "}, {:x=>3, :y=>7, :letter=>" "}, {:x=>3, :y=>8, :letter=>" "}
{:x=>4, :y=>1, :letter=>"o"}, {:x=>4, :y=>2, :letter=>" "}, {:x=>4, :y=>3, :letter=>" "}, {:x=>4, :y=>4, :letter=>" "}, {:x=>4, :y=>5, :letter=>" "}, {:x=>4, :y=>6, :letter=>" "}, {:x=>4, :y=>7, :letter=>" "}, {:x=>4, :y=>8, :letter=>" "}
{:x=>5, :y=>1, :letter=>"b"}, {:x=>5, :y=>2, :letter=>"u"}, {:x=>5, :y=>3, :letter=>" "}, {:x=>5, :y=>4, :letter=>" "}, {:x=>5, :y=>5, :letter=>" "}, {:x=>5, :y=>6, :letter=>" "}, {:x=>5, :y=>7, :letter=>" "}, {:x=>5, :y=>8, :letter=>" "}
{:x=>6, :y=>1, :letter=>"r"}, {:x=>6, :y=>2, :letter=>"y"}, {:x=>6, :y=>3, :letter=>" "}, {:x=>6, :y=>4, :letter=>" "}, {:x=>6, :y=>5, :letter=>" "}, {:x=>6, :y=>6, :letter=>" "}, {:x=>6, :y=>7, :letter=>" "}, {:x=>6, :y=>8, :letter=>" "}
{:x=>7, :y=>1, :letter=>" "}, {:x=>7, :y=>2, :letter=>" "}, {:x=>7, :y=>3, :letter=>" "}, {:x=>7, :y=>4, :letter=>" "}, {:x=>7, :y=>5, :letter=>" "}, {:x=>7, :y=>6, :letter=>" "}, {:x=>7, :y=>7, :letter=>" "}, {:x=>7, :y=>8, :letter=>" "}
{:x=>8, :y=>1, :letter=>"x"}, {:x=>8, :y=>2, :letter=>"x"}, {:x=>8, :y=>3, :letter=>"x"}, {:x=>8, :y=>4, :letter=>"x"}, {:x=>8, :y=>5, :letter=>"x"}, {:x=>8, :y=>6, :letter=>"x"}, {:x=>8, :y=>7, :letter=>"x"}, {:x=>8, :y=>8, :letter=>"x"}]




def neighbormover(candidate,letter,board)
  neighborx = candidate[:x]
  neighbory = candidate[:y]+1
  candidatehash = board.select { |num| num[:x] == candidate[:x] && num[:y] == candidate[:y]}
  neighbor = board.select { |num| num[:x] == neighborx && num[:y] == neighbory}
  if neighbor.length == 0
    puts "neighbormover letter placement failed on candidate: #{candidatehash} , neighbor: #{neighbor}"
    return false
  elsif candidatehash[0][:letter] == " "
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        binding.pry
        overwrite[:letter] = letter
      end
    end
  elsif neighbor[0][:letter] ==
    nhash = Hash[ :x, neighbor[0][:x], :y, neighbor[0][:y] ]
    neighbormover(nhash,board)
    board.each do |overwrite|
      if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
        binding.pry
        overwrite[:letter] = candidate[:letter]
      end
    end
  end
  return [neighbor[0][:x], neighbor[0][:y]],board
end


{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
{"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
{"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
{"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
{"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
{"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
{"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
{"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"z"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]

[["1", "1", " "], ["1", "2", "e"], ["1", "3", "t"], ["1", "4", "n"], ["1", "5", "e"], ["1", "6", "c"], ["1", "7", "s"], ["1", "8", "i"], ["2", "1", "a"], ["2", "2", "i"], ["2", "3", " "], ["2", "4", "m"], ["2", "5", "o"], ["2", "6", "d"], ["2", "7", "p"], ["2", "8", "e"], ["3", "1", "l"], ["3", "2", "r"], ["3", "3", "e"], ["3", "4", "n"], ["3", "5", "y"], ["3", "6", "r"], ["3", "7", "r"], ["3", "8", "a"], ["4", "1", "v"], ["4", "2", "n"], ["4", "3", "a"], ["4", "4", "s"], ["4", "5", "m"], ["4", "6", "a"], ["4", "7", "a"], ["4", "8", "n"], ["5", "1", "g"], ["5", "2", "a"], ["5", "3", "i"], ["5", "4", "e"], ["5", "5", "u"], ["5", "6", "m"], ["5", "7", "r"], ["5", "8", "o"], ["6", "1", "u"], ["6", "2", "d"], ["6", "3", "t"], ["6", "4", "v"], ["6", "5", "e"], ["6", "6", "s"], ["6", "7", "m"], ["6", "8", "u"], ["7", "1", "e"], ["7", "2", "n"], ["7", "3", "r"], ["7", "4", "d"], ["7", "5", "e"], ["7", "6", "c"], ["7", "7", "n"], ["7", "8", "l"], ["8", "1", "v"], ["8", "2", "o"], ["8", "3", "b"], ["8", "4", "i"], ["8", "5", "r"], ["8", "6", "d"], ["8", "7", "i"], ["8", "8", "s"]]["e", "t", "n", "e", "c", "s", "i", " "]["a", "i", "m", "o", "d", "p", "e", " "]["l", "r", "e", "n", "y", "r", "r", "a"]["v", "n", "a", "s", "m", "a", "a", "n"]["g", "a", "i", "e", "u", "m", "r", "o"]["u", "d", "t", "v", "e", "s", "m", "u"]["e", "n", "r", "d", "e", "c", "n", "l"]["v", "o", "b", "i", "r", "d", "i", "s"]
[["1", "1", "g"], ["1", "2", "e"], ["1", "3", "t"], ["1", "4", "n"], ["1", "5", "e"], ["1", "6", "c"], ["1", "7", "s"], ["1", "8", "i"], ["2", "1", "a"], ["2", "2", "i"], ["2", "3", "r"], ["2", "4", "m"], ["2", "5", "o"], ["2", "6", "d"], ["2", "7", "p"], ["2", "8", "e"], ["3", "1", "l"], ["3", "2", "r"], ["3", "3", "e"], ["3", "4", "n"], ["3", "5", "y"], ["3", "6", "r"], ["3", "7", "r"], ["3", "8", "a"], ["4", "1", "v"], ["4", "2", "n"], ["4", "3", "a"], ["4", "4", "s"], ["4", "5", "m"], ["4", "6", "a"], ["4", "7", "a"], ["4", "8", "n"], ["5", "1", "g"], ["5", "2", "a"], ["5", "3", "i"], ["5", "4", "e"], ["5", "5", "u"], ["5", "6", "m"], ["5", "7", "r"], ["5", "8", "o"], ["6", "1", "u"], ["6", "2", "d"], ["6", "3", "t"], ["6", "4", "v"], ["6", "5", "e"], ["6", "6", "s"], ["6", "7", "m"], ["6", "8", "u"], ["7", "1", "e"], ["7", "2", "n"], ["7", "3", "r"], ["7", "4", "d"], ["7", "5", "e"], ["7", "6", "c"], ["7", "7", "n"], ["7", "8", "l"], ["8", "1", "v"], ["8", "2", "o"], ["8", "3", "b"], ["8", "4", "i"], ["8", "5", "r"], ["8", "6", "d"], ["8", "7", "i"], ["8", "8", "s"]]["g", "e", "t", "n", "e", "c", "s", "i"]["a", "i", "r", "m", "o", "d", "p", "e"]["l", "r", "e", "n", "y", "r", "r", "a"]["v", "n", "a", "s", "m", "a", "a", "n"]["g", "a", "i", "e", "u", "m", "r", "o"]["u", "d", "t", "v", "e", "s", "m", "u"]["e", "n", "r", "d", "e", "c", "n", "l"]["v", "o", "b", "i", "r", "d", "i", "s"]


blankboard = [{"x":1,"y":1,"letter":"a"},{"x":1,"y":2,"letter":"b"},{"x":1,"y":3,"letter":"c"}]


blankboard = [{"x":1,"y":1,"letter":" "},{"x":1,"y":2,"letter":" "},{"x":4,"y":3,"letter":" "}]

  [prev[:x]] .include?(num[:x])
  [(prev[:y]-1),(prev[:y]+1)] .include?(num[:y])
  [(prev[:x]-1),(prev[:x]+1)]  .include?(num[:x])
  [prev[:y]].include?(num[:y])
  [(prev[:x]-1),(prev[:x]+1)]  .include?(num[:x])
  [(prev[:y]-1),(prev[:y]+1)] .include?(num[:y])


  {"x"=>1, "y"=>1, "letter"=>" "}, {"x"=>1, "y"=>2, "letter"=>" "}, {"x"=>1, "y"=>3, "letter"=>" "}, {"x"=>1, "y"=>4, "letter"=>" "}, {"x"=>1, "y"=>5, "letter"=>" "}, {"x"=>1, "y"=>6, "letter"=>" "}, {"x"=>1, "y"=>7, "letter"=>" "}  {"x"=>1, "y"=>8, "letter"=>" "}
  {"x"=>2, "y"=>1, "letter"=>" "}, {"x"=>2, "y"=>2, "letter"=>" "}, {"x"=>2, "y"=>3, "letter"=>" "}, {"x"=>2, "y"=>4, "letter"=>" "}, {"x"=>2, "y"=>5, "letter"=>" "}, {"x"=>2, "y"=>6, "letter"=>" "}  {"x"=>2, "y"=>7, "letter"=>" "}  {"x"=>2, "y"=>8, "letter"=>" "}
  {"x"=>3, "y"=>1, "letter"=>"b"}, {"x"=>3, "y"=>2, "letter"=>" "}, {"x"=>3, "y"=>3, "letter"=>" "}, {"x"=>3, "y"=>4, "letter"=>" "}, {"x"=>3, "y"=>5, "letter"=>" "}  {"x"=>3, "y"=>6, "letter"=>" "}, {"x"=>3, "y"=>7, "letter"=>" "}, {"x"=>3, "y"=>8, "letter"=>" "}
  {"x"=>4, "y"=>1, "letter"=>"o"}, {"x"=>4, "y"=>2, "letter"=>"f"}, {"x"=>4, "y"=>3, "letter"=>" "}, {"x"=>4, "y"=>4, "letter"=>" "}  {"x"=>4, "y"=>5, "letter"=>" "}  {"x"=>4, "y"=>6, "letter"=>" "}, {"x"=>4, "y"=>7, "letter"=>" "}, {"x"=>4, "y"=>8, "letter"=>" "},
  {"x"=>5, "y"=>1, "letter"=>"b"}, {"x"=>5, "y"=>2, "letter"=>" "}, {"x"=>5, "y"=>3, "letter"=>" "}  {"x"=>5, "y"=>4, "letter"=>" "}, {"x"=>5, "y"=>5, "letter"=>" "}, {"x"=>5, "y"=>6, "letter"=>" "}, {"x"=>5, "y"=>7, "letter"=>" "}, {"x"=>5, "y"=>8, "letter"=>" "}
  {"x"=>6, "y"=>1, "letter"=>" "}, {"x"=>6, "y"=>2, "letter"=>" "}  {"x"=>6, "y"=>3, "letter"=>" "}, {"x"=>6, "y"=>4, "letter"=>" "}, {"x"=>6, "y"=>5, "letter"=>" "}, {"x"=>6, "y"=>6, "letter"=>" "}, {"x"=>6, "y"=>7, "letter"=>" "}, {"x"=>6, "y"=>8, "letter"=>" "}
  {"x"=>7, "y"=>1, "letter"=>" "}  {"x"=>7, "y"=>2, "letter"=>" "}, {"x"=>7, "y"=>3, "letter"=>" "}, {"x"=>7, "y"=>4, "letter"=>" "}, {"x"=>7, "y"=>5, "letter"=>" "}, {"x"=>7, "y"=>6, "letter"=>" "}, {"x"=>7, "y"=>7, "letter"=>" "}, {"x"=>7, "y"=>8, "letter"=>" "}
  {"x"=>8, "y"=>1, "letter"=>"x"}  {"x"=>8, "y"=>2, "letter"=>"x"}, {"x"=>8, "y"=>3, "letter"=>"x"}, {"x"=>8, "y"=>4, "letter"=>"x"}, {"x"=>8, "y"=>5, "letter"=>"x"}, {"x"=>8, "y"=>6, "letter"=>"x"}, {"x"=>8, "y"=>7, "letter"=>"x"}  {"x"=>8, "y"=>8, "letter"=>"x"}]

irb(main):009:0> blankboard.select { |num| (1..2).include?(num[:y] }
irb(main):010:1> blankboard.select { |num| (1..2).include?(num[:y]) }
irb(main):011:1> blankboard.select { |num| [1,2].include?(num[:y]) }
irb(main):012:1> blankboard.select { |num| (1,2).include?(num[:y]) }
irb(main):013:1> blankboard.select { |num| (1,2.include?(num[:y]) }
irb(main):014:2> blankboard = [{"x":1,"y":1,"letter":" "},{"x":1,"y":2,"letter":" "},{"x":1,"y":3,"letter":" "}]
irb(main):015:2> blankboard.select { |num| (1,2.include?(num[:y]) }
irb(main):016:3> blankboard.select { |num| num[:y] == 2 && num[:x] == 1 && num[:letter] != "b"}
irb(main):017:3> blankboard.select { |num| num[:y] == 2 && num[:x] == 1 && num[:letter] == " "}
irb(main):018:3> blankboard.select { |num| num[:y] == 2 && num[:x] == 1 && num[:letter] == " "}


[[4, 5], [3, 4], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[4, 5], [3, 4], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[4, 5], [3, 4], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[4, 5], [3, 4], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [1, 5], [1, 4], [2, 3], [2, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [1, 5], [1, 4], [2, 3], [2, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [1, 5], [1, 4], [2, 3], [3, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[3, 7], [2, 6], [1, 5], [1, 4], [2, 3], [3, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [2, 5], [1, 4], [2, 3], [2, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [2, 5], [1, 4], [2, 3], [3, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [1, 5], [1, 4], [2, 3], [2, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [1, 5], [1, 4], [2, 3], [2, 2], [2, 1], [3, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [1, 5], [1, 4], [2, 3], [3, 2], [2, 1], [2, 2], [3, 1], [4, 1]],
[[1, 6], [2, 6], [1, 5], [1, 4], [2, 3], [3, 2], [2, 1], [3, 2], [3, 1], [4, 1]]]









[[[7, 5], [1, 2], [2, 2], [2, 3], [3, 3], [7, 5]],
 [[7, 5], [1, 2], [2, 2], [2, 3], [3, 3], [7, 3]]
 [[7, 5], [1, 2], [2, 2], [2, 3], [3, 3], [7, 1]]
 [[7, 5], [1, 2], [2, 2], [2, 3], [3, 3], [3, 4]]
 [[7, 5], [1, 2], [2, 2], [2, 3], [3, 3], [1, 1]]]



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


<BoardSpace:0x000056422406dc60 @x=1, @y=1, @letter="h">, <BoardSpace:0x000056422406dbe8 @x=1, @y=2, @letter="y">, <BoardSpace:0x000056422406db70 @x=1, @y=3, @letter="e">,
↳ app/models/board.rb:42
Puzzle Create (2.2ms)  INSERT INTO "puzzles" ("board", "words", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["board", "{#<BoardSpace:0x000056422406dc60>,
#<BoardSpace:0x000056422406dbe8>,
#<BoardSpace:0x000056422406db70>,... ["words", "{unfortunately,livermorium,associate,innocent,capacity,emerge,fifth,star}"], ["created_at", "2019-03-06 00:09:20.425116"], ["updated_at", "2019-03-06 00:09:20.425116"]]




* builder is complete: can easily generate a board.
moving on to move updater, which will shift the letters when a successful play is made

also on the to-do list:
game turn manager
  start of game:
    get board from database
  ongoing maint:
    display board on page
    track words found
    display found words on page
  win:
    all words found (end on last word found)


"experimental"=> [["e", 2, 1],  ["x", 1, 1],  ["p", 2, 2],  ["e", 2, 3],  ["r", 3, 3],  ["i", 4, 3],  ["m", 3, 2],  ["e", 3, 1],  ["n", 4, 1],  ["t", 5, 1],  ["a", 5, 2],  ["l", 6, 3]],
"undertake"=> [["u", 1, 2],  ["n", 1, 3],  ["d", 1, 4],  ["e", 2, 5],  ["r", 1, 5],  ["t", 2, 4],  ["a", 3, 4],  ["k", 4, 5],  ["e", 4, 4]],
"counselor"=> [["c", 7, 2],  ["o", 6, 2],  ["u", 6, 1],  ["n", 7, 1],  ["s", 8, 1],  ["e", 8, 2],  ["l", 8, 3],  ["o", 8, 4],  ["r", 7, 4]],
"extent"=>[["e", 8, 7], ["x", 7, 6], ["t", 7, 5], ["e", 6, 5], ["n", 6, 4], ["t", 7, 3]],
"radar"=>[["r", 3, 7], ["a", 2, 7], ["d", 3, 6], ["a", 3, 5], ["r", 2, 6]],
"draft"=>[["d", 1, 8], ["r", 1, 7], ["a", 2, 8], ["f", 3, 8], ["t", 4, 8]],
"idaho"=>[["i", 6, 6], ["d", 7, 7], ["a", 8, 8], ["h", 7, 8], ["o", 6, 7]],
"heron"=>[["h", 5, 6], ["e", 4, 6], ["r", 4, 7], ["o", 5, 8], ["n", 6, 8]],
"aims"=>[["a", 5, 3], ["i", 4, 2], ["m", 5, 4], ["s", 5, 5]],
"sick"=>[["s", 5, 7]]}



["significantly", "carboniferous", "storage", "minimum", "cost", "date", "margin", "margin", "away"]
