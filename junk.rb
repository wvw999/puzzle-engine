{"x":1,"y":1,"letter":"s"},{"x":1,"y":2,"letter":"n"},{"x":1,"y":3,"letter":"z"},{"x":1,"y":4,"letter":"z"},{"x":1,"y":5,"letter":"z"},{"x":1,"y":6,"letter":"z"},{"x":1,"y":7,"letter":"z"},{"x":1,"y":8,"letter":"z"},
{"x":2,"y":1,"letter":"z"},{"x":2,"y":2,"letter":"a"},{"x":2,"y":3,"letter":"k"},{"x":2,"y":4,"letter":"z"},{"x":2,"y":5,"letter":"z"},{"x":2,"y":6,"letter":"z"},{"x":2,"y":7,"letter":"z"},{"x":2,"y":8,"letter":"z"},
{"x":3,"y":1,"letter":"z"},{"x":3,"y":2,"letter":"z"},{"x":3,"y":3,"letter":"e"},{"x":3,"y":4,"letter":"s"},{"x":3,"y":5,"letter":"z"},{"x":3,"y":6,"letter":"z"},{"x":3,"y":7,"letter":"z"},{"x":3,"y":8,"letter":"z"},
{"x":4,"y":1,"letter":"z"},{"x":4,"y":2,"letter":"z"},{"x":4,"y":3,"letter":"z"},{"x":4,"y":4,"letter":"z"},{"x":4,"y":5,"letter":"z"},{"x":4,"y":6,"letter":"z"},{"x":4,"y":7,"letter":"z"},{"x":4,"y":8,"letter":"z"},
{"x":5,"y":1,"letter":"z"},{"x":5,"y":2,"letter":"z"},{"x":5,"y":3,"letter":"z"},{"x":5,"y":4,"letter":"z"},{"x":5,"y":5,"letter":"z"},{"x":5,"y":6,"letter":"z"},{"x":5,"y":7,"letter":"z"},{"x":5,"y":8,"letter":"z"},
{"x":6,"y":1,"letter":"z"},{"x":6,"y":2,"letter":"z"},{"x":6,"y":3,"letter":"z"},{"x":6,"y":4,"letter":"z"},{"x":6,"y":5,"letter":"z"},{"x":6,"y":6,"letter":"z"},{"x":6,"y":7,"letter":"z"},{"x":6,"y":8,"letter":"z"},
{"x":7,"y":1,"letter":"z"},{"x":7,"y":2,"letter":"z"},{"x":7,"y":3,"letter":"z"},{"x":7,"y":4,"letter":"z"},{"x":7,"y":5,"letter":"z"},{"x":7,"y":6,"letter":"z"},{"x":7,"y":7,"letter":"z"},{"x":7,"y":8,"letter":"z"},
{"x":8,"y":1,"letter":"z"},{"x":8,"y":2,"letter":"z"},{"x":8,"y":3,"letter":"z"},{"x":8,"y":4,"letter":"z"},{"x":8,"y":5,"letter":"z"},{"x":8,"y":6,"letter":"z"},{"x":8,"y":7,"letter":"z"},{"x":8,"y":8,"letter":"z"}]


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


[[[3, 4], [1, 2], [8, 3], [2, 3], [3, 3], [3, 4]],
 [[3, 4], [1, 2], [2, 2], [2, 3], [3, 3], [3, 4]],
 [[3, 4], [1, 2], [1, 3], [2, 3], [3, 3], [3, 4]],
 [[3, 4], [1, 2], [8, 3], [2, 3], [3, 3], [1, 1]],
 [[3, 4], [1, 2], [2, 2], [2, 3], [3, 3], [1, 1]],
 [[3, 4], [1, 2], [1, 3], [2, 3], [3, 3], [1, 1]]]

[[[1, 1], [1, 2], [2, 2], [2, 3], [3, 3]],
[[1, 1], [1, 2], [1, 3], [2, 3], [3, 3]]]



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
