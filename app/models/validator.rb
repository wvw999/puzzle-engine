require_relative 'board'

class Validator


end

def solution_processor(board, words, solution)
  wordspermuted = words.permutation.to_a
  wordarraylength = words.length
  runningcopy = board.clone
  permutedindex = 0
  10.times do
    wordpert = wordspermuted[permutedindex]
    gogetter = recursing(board, wordpert, solution)
    if solution == []
      puts "no solution found"
    else
      print solution
    end
    binding.pry
    permutedindex += 1
  end
end

def recursing(board, words, solution)
  # needs to look up first word in permuted arr
  # find valid locations for that word
  # loop over each trying to find a path through the board
  # if valid path to next word found, recurse to repeat this for next word in list
  # thus, if valid, remove fisrt value in permuted list, pass to self in recursion
  # if no values of first word register
  # kick loop back to previous level

  tempboard = board.clone
  xyletters = word_letter_lookup(words[0], testboard)
  permutedword = word_permuter(xyletters)
  proofedlist = wordlistproofer(permutedwords)
  if proofedlist
    lesswords = words.delete_at(0)
    if words.length == 1
      solution.push proofedlist[0]
      return solution
    else
      proofedlist.each do |eachcheck|
        wordremover(eachcheck, tempboard)
        puzzleupdater(tempboard)
        solution.push eachcheck
        recursing(tempboard, lesswords, solution)
      end
    end
  else
    return false
  end
end

def word_letter_lookup(word,board)
  samplewordarray = word.split('').to_a
  word_len = word.length
  alllocations = []
  individuallocation = []
  samplewordarray.each do |build|
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

def wordlistproofer(list)
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
end

def puzzleupdater(board)
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
