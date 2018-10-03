class Board

  def initialize
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @steps = [-11, -10, -9, -1, 1, 9, 10, 11]
  end

  def make_board(wordlist)
    @blank_board = @empty_board.clone
    wordlist.each do |word|
      list_of_ninenines
      word_space_loop(word.length, word)
    end
  end

  def list_of_ninenines
    @list_of_ninenine = []
    @valid_spaces.each do |ninenine|
      if @blank_board[ninenine] == 99
        @list_of_ninenine.push(ninenine)
      end
    end
  end

  def word_space_loop(length_of_word, candidate_word)
    candidate_word_array = []
    candidate_word_array.push(@list_of_ninenine)
    @list_of_ninenine.delete(candidate_word_array[-1])
    (length_of_word-1).times do |pickspaces|

    end
  end

  # pseudocode begins

  def thingy

      clone of blank board 'candidate board' X #plain old copy of empty board to begin the board building process

        'list of 99s' from 'candidate board' X #this is the index of a space with 99 from the candidate board

        loop init
          declare 'candidate word array'
          select space 1 randomly from 'list of 99s'
          push space 1 to 'candidate word array'
          remove space 1 from 'list of 99s'
          loop begin
            build new array 'list of neighbors' of 'candidate word array'[-1]
            select subsequent space randomly from 'list of neighbors', push to 'candidate word array'
            remove subsequent space from 'list of 99s'
            (do until end of word or no neighbors found)
          end loop
        end loop

        at the end of each loop, push values from 'candidate word array' to 'candidate board'

  end

end
