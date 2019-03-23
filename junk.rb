#
# testwords = ["responsibility", "position", "eastern", "search", "monkey", "media", "photo", "chief", "than", "nose"]
#

Problem:

full columns are getting data deleted out of them somehow.

neighbors keeps getting processed and ending up a lone hash instead of an array with hash(es) inside

# testboard = [{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
# {"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
# {"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
# {"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
# {"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
# {"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
# {"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
# {"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"s"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]



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
