require_relative 'board'

class Validator


end

def solution_processor(board, words, solution, solved)
  wordspermuted = words.permutation.to_a
  wordarraylength = words.length
  runningcopy = board.clone
  permutedindex = 0
  2.times do
    puts "loop number #{permutedindex}"
    wordpert = wordspermuted[permutedindex]
    puts "here is wordpert #{wordpert}"
    gogetter = recursing(board, wordpert, solution, solved)
    if solution == []
      puts "no solution found"
    else
      print solved
      puts " "
      print solution
    end
    binding.pry
    permutedindex += 1
  end
end

def recursing(board, words, solution, solved)
  failed = false
  unless solved == 1 || failed == true
    puts "trying word #{words[0]} out of list #{words}"
    length = words[0].length
    tempboard = board.clone
    xyletters = word_letter_lookup(words[0], tempboard)
    puts "was able to build xyletters #{xyletters}\n\n"
    permutedwordlist = word_permuter(xyletters)
    puts "was able to build permutedwordlist\n\n"
    proofedlist = wordlistproofer(permutedwordlist, length)
    puts "was able to build proofedlist #{proofedlist}\n\n"
    if proofedlist
      puts "this is words, #{words[0]} , from which we delete just now #{words}\n\n"
      if words.length == 1
        puts "words length equals 1 #{words}\n\n"
        solution.push proofedlist[0]
        solved = 1
        return solution
      else
        lesswords = words.delete_at(0)
        proofedlist.each do |eachcheck|
          puts "working on eachcheck #{eachcheck}"
          removedword = wordremover(eachcheck, tempboard)
          puts "got past wordremover"
          updatedboard = puzzleupdater(removedword)
          puts "got past puzzleupdater"
          solution.push eachcheck
          puts "added eachcheck to solution #{solution}"
          recursing(updatedboard, lesswords, solution, solved)
        end
      end
    else
      puts "hit false at end of a recurse attempt"
      failed = true
      return false
    end
  end
end

def word_letter_lookup(word,board)
  wordarray = word.split('').to_a
  word_len = wordarray.length
  alllocations = []
  individuallocation = []
  wordarray.each do |build|
    board.each do |compare|
      if compare[2] === build
        j = compare[0].to_i
        k = compare[1].to_i
        individuallocation.push [j,k]
      end
    end
    alllocations.push individuallocation
    individuallocation = []
  end
  if alllocations == []
    return false
  else
    return alllocations
  end
end

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

def wordlistproofer(list, len)
  proofed_list = []
  list.each do |process|
      indexofsolution = 0
      failed = 0
      (len-1).times do |checkpairs|
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
      end
      failed = 0
  end
  proofed_list.each do |dropdupes|
    if dropdupes.uniq.length < len
      proofed_list.delete dropdupes
    end
  end
  return proofed_list
end

def wordremover(xyset, board)
  xyset.each do |removeletter|
    board.each do |checkcoords|
      xcoord = checkcoords[0].to_i
      ycoord = checkcoords[1].to_i
      if removeletter[0] == xcoord && removeletter[1] == ycoord
        checkcoords[2] = " "
      end
    end
  end
  return board
end

def puzzleupdater(board)
  tempboard = []
  print tempboard
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
