require_relative 'board'

class Validator


end

def solution_processor(board, words)
  wordspermuted = words.permutation.to_a
  wordarraylength = words.length
  wordsindex = 1
  solutionfound = false
  tempboard = board.clone
  until wordsindex == wordspermuted.length || solutionfound == true
    current = wordspermuted[wordsindex]
    currentfail = false
    while currentfail == false || solutionfound == false
      attemptindex = 0
      wordarraylength.times do |checkeachword|
        xyletters = word_letter_lookup(current[attemptindex], testboard)
        if xyletters == false
          currentfail == true
          break
        else
          permutedword = word_permuter(xyletters)
          proofedlist = wordlistproofer(permutedwords)
          attemptindex += 1
        end

      end
    end
    wordsindex += 1
  end
end



# builds array of all xy vals for all letters in a word
def word_letter_lookup(word,board)
  samplewordarray = word.split('').to_a
  word_len = word.length
  alllocations = []
  individuallocation = []
  samplewordarray.each do |build|
    board.each do |compare|
      if compare[2] === build
        j = compare[0]
        k = compare[1]
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

# builds an array of arrays of all possible permutations
# of letters assembled by word_letter_lookup
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
      # if xy vals match, change space to blank
    end
  end
end

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
