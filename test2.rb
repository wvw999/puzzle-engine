testboard = [["1","1"," "],["1","2","e"],["1","3","t"],["1","4","n"],["1","5","e"],["1","6","c"],["1","7","s"],["1","8","i"],["2","1","a"],["2","2","i"],["2","3"," "],["2","4","m"],["2","5","o"],["2","6","d"],["2","7","p"],["2","8","e"],["3","1","l"],["3","2","r"],["3","3","e"],["3","4","n"],["3","5","y"],["3","6","r"],["3","7","r"],["3","8","a"],["4","1","v"],["4","2","n"],["4","3","a"],["4","4","s"],["4","5","m"],["4","6","a"],["4","7","a"],["4","8","n"],["5","1","g"],["5","2","a"],["5","3","i"],["5","4","e"],["5","5","u"],["5","6","m"],["5","7","r"],["5","8","o"],["6","1","u"],["6","2","d"],["6","3","t"],["6","4","v"],["6","5","e"],["6","6","s"],["6","7","m"],["6","8","u"],["7","1","e"],["7","2","n"],["7","3","r"],["7","4","d"],["7","5","e"],["7","6","c"],["7","7","n"],["7","8","l"],["8","1","v"],["8","2","o"],["8","3","b"],["8","4","i"],["8","5","r"],["8","6","d"],["8","7","i"],["8","8","s"]]


# This code will take the current puzzle storage scheme from DB and render
# updates during game play and also for solver
# when letters are removed, the board is updated correctly

tempboard = []
print testboard
  xcounter = 1
8.times do |countcols|
  outputarr = []
  ycounter = 1
  testboard.each do |collect|
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
