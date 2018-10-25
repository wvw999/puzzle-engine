class Board

  def initialize
    # lots of ugly data required for dealing with the game board
    # indexes of all '99' values on a starting board. used to check for remaining '99's as board is being built
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    # values to locate neighboring spaces, values are "current index plus [this value]"
    @steps = [[-11, -10, -9, -1, 1, 9, 10, 11],[-19, -20, -21, 19, 20, 21],[-29, -30, -31, 29, 30, 31],[-39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]]
    # list of all 'step' spaces, is used by 'good_neighbor' check
    # which will tell the board-building attempt to fail if there is a blank space on the board with no neighbors
    # idea! good_neighbor currently runs before trying to place a word's letters
    # instead, make good_neighbor part of the word-letter-placement step, telling total_bastard to try again if current attempt to place word letter would result in leaving an orphaned space
    @stepsall = [-11, -10, -9, -1, 1, 9, 10, 11, -19, -20, -21, 19, 20, 21, -29, -30, -31, 29, 30, 31, -39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]
    @try_counter = 0
    @list_of_neighbors = []
    @candidate_word_array = []
    # example of candidate word array : [[[1,"c"], [2, "a"], [3, "t"]], [[4, "d"], [5, "o"], [6, "g"]]]
    # two words, at board index 1,2,3 and 4,5,6 respectively (not actually valid), each word stored as an array of arrays
  end

  def make_board(word_list)
    @complete_board = @empty_board.clone
    word_list.each do |placement|
      puts @try_counter
      success = 0
      while success == 0 do
        # clone the blank board - makes throw-away copy of the empty board array
          # which will be used to build a temporary running model of the board while
        # attempts are made to place a word on the board
        @disposable_board = @empty_board.clone
        # place existing words from candidate word array onto temp board
        update_disposable_board
        # get ninenines - list of spaces on disposable board which are '99' - aka, blank
        # if there are no 99s left, the board is done, and the loop can quit
        if ninenines == []
          success = 1
          break
        end
        # look for spaces for letters of current word
          # moved word_to_board inside of total_bastard
          # places letters onto disposable_board
          # once all letters in word are on disposable board, run good neighbor check
          # ensures all remaining blank spaces on board have at least one blank space as a neighbor
        # if there are no neighbors, good neighbor should cause the board building to start over
        if total_bastard(placement)
          # appends the newly built temp_letter_array to candidate_word_array
          @candidate_word_array.push(@temp_letter_array)
          success = 1
        else
          break
        end
        # success loop ends here. if no success, should re-try word placement from the top again
        break if @try_counter >= 20000
      end
      if @try_counter >= 20000
        puts "loop caounter cantaloper beep boop"
        break
      end
    end
    return @candidate_word_array
  end

  # takes candidate word array and adds to disposable board
  def update_disposable_board
    if @candidate_word_array == []
      # do nothing- required case in order to skip nil error for first word, do nothing to disposable board
    else
      # prepares the throw-away copy of board to be used when placing current word
      @candidate_word_array.each do |writetoboard|
        writetoboard.each do |writeletter|
          @disposable_board[writeletter[0]] = writeletter[1]
        end
      end
    end
  end

  def ninenines
    @list_of_ninenines = []
    @valid_spaces.each do |ninenine|
      if @disposable_board[ninenine] == 99
        @list_of_ninenines.push(ninenine)
      end
    end
  end

  def good_neighbor
    # seems like some reference to borrowing the lawn mower and not returning it should be here
    @good_neighbor_fail = 0
    # take each instance of 99 on the temp game board and make sure it has a neighbor
    @list_of_ninenines.each do |verify|
      @neighbor = []
      @stepsall.each do |pair|
        if verify + pair == 99
          if @list_of_ninenines.include?(verify + pair)
            @neighbor.push(verify)
          end
        end
      end
      puts @neighbor
      # if any value in @list_of_ninenine has no neighbors, fail good_neighbor
      if @neighbor == []
        @good_neighbor_fail = 1
      end
    end
    if @good_neighbor_fail == 1
      # puts "good neighbor failed"
      @good_neighbor_fail = 0
      return false
    end
  end

  def total_bastard(word)
    ninenines
    @word_letters_array = word.split("")
    @word_length = @word_letters_array.length
    @word_success = 0
    @temp_letter_array = []
    while @word_success == 0 do
      @break_this = 0
      puts "here is temp letter array:"
      print @temp_letter_array
      puts " "
      @word_letters_array.each do |searchy|
            puts word
        @searchy = searchy
        @try_counter += 1
        @disposable_board_two = @disposable_board.clone
        if @temp_letter_array == []
          #step is for first letter of word, all others get alternate path
          @temp_letter_array.push([@list_of_ninenines.sample, @searchy])
          word_to_board
          if !good_neighbor
            @break_this = 1
            # binding.pry
            # add current word values to board solution array, complete loop successfully, on to next word
            # need to ensure that this break kicks us up to the "while word_success" loop
            break
          end
          @list_of_ninenines.delete(@temp_letter_array[-1])
        else
          # other letters check
          @current_space = @temp_letter_array[-1][0]
          @list_of_neighbors = []
          @pushed = 0
          # list of neighbors will now be an array of arrays [[1, 2, 3], [4, 5, 6]]
          @steps.each do |buildneighbors|
            @temp_array = []
            buildneighbors.each do |internals|
              if @list_of_ninenines.include?(@current_space + internals)
                @temp_array.push(@current_space + internals)
              end
            end
            @list_of_neighbors.push(@temp_array)
          end
          # binding.pry
          if @list_of_neighbors == [[],[],[],[]]
            puts "list of neighbors came up blank. crap."
            break
          else
            @list_of_neighbors.each do |lookupone|
              if @pushed == 0
                if lookupone == []
                  break
                else
                  @temp_letter_array.push([lookupone.sample, @searchy])
                  @pushed = 1
                end
              end
            end
          end
          # writes newly-added entry in temp word array to disposable_board_two
          word_to_board
          # runs good_neighbor
          if !good_neighbor
            @break_this = 1
            @temp_letter_array = []
            # add current word values to board solution array, complete loop successfully, on to next word
            break
          end
          @list_of_ninenines.delete(@temp_letter_array[-1])
        end
      end
      if @temp_letter_array.length == @word_letters_array.length
        @word_success = 1
      end

      # if @break_this == 1
      #   break
      # end
      # building temp_letter_array from word_letters_array loop ends here if success = 1
      # if it does not have word success, then it should re-run.
    end
  end

  # should only take the current word's letters and place the letters in temp_letter_array on disposable_board_two
  def word_to_board
    # update temp board with current word letters.
    @temp_letter_array.each do |validating|
      @disposable_board_two.push(validating[1])
    end
  end

end
