class Board

  def initialize
    # lots of ugly data required for dealing with the game board
    # indexes of all '99' values on a starting board. used to check for remaining '99's as board is being built
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    # values to locate neighboring spaces, values are "current index plus [this value]"
    @steps = [-11, -10, -9, -1, 1, 9, 10, 11]
    # if no immediate neighbors are found, will try to look up a row further, or down a row further
    @stepsdownone = [-19, -20, -21]
    @stepsupone = [19, 20, 21]
    @stepsdowntwo = [-29, -30, -31]
    @stepsuptwo = [29, 30, 31]
    # giving up and looking at all remaining far-away but valid spaces
    @stepsdownthree = [-39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71]
    @stepsupthree = [39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]
    # list of all 'step' spaces, is used by 'good_neighbor' check
    # which will tell the board-building attempt to fail if there is a blank space on the board with no neighbors
    # idea! good_neighbor currently runs before trying to place a word's letters
    # instead, make good_neighbor part of the word-letter-placement step, telling total_bastard to try again if current attempt to place word letter would result in leaving an orphaned space
    @stepsall = [-11, -10, -9, -1, 1, 9, 10, 11, -19, -20, -21, 19, 20, 21, -29, -30, -31, 29, 30, 31, -39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]
    @loop_counter = 0
    @list_of_neighbors = []
    @candidate_word_array = []
    # example of candidate word array : [[[1,"c"], [2, "a"], [3, "t"]], [[4, "d"], [5, "o"], [6, "g"]]]
    # two words, at board index 1,2,3 and 4,5,6 respectively (not actually valid), each word stored as an array of arrays
  end

  def make_board(word_list,try_counter,board_is_complete)
    @try_counter = try_counter
    @board_is_complete = coard_is_complete
    @complete_board = @empty_board.clone
    word_list.each do |placement|
      success = 0
      while success do |wordy|
        # clone the blank board - makes throw-away copy of the empty board array
        # which will be used to build a temporary running model of the board while
        # attempts are made to place a word on the board
        @disposable_board = @empty_board.clone
        # place existing words
        update_disposable_board
        # get ninenines - list of spaces on disposable board which are '99' - aka, blank
        ninenines
        # look for spaces for letters of current word
        # moved word_to_board inside of total_bastard
        # places letters onto disposable_board
            # once all letters in word are on disposable board, run good neighbor check
            # ensures all remaining blank spaces on board have at least one blank space as a neighbor
            # if there are no neighbors, good neighbor should cause the board building to start over
        if total_bastard(placement)
          success = 1
        end
        break if @loop_counter >= 20000
      end
      break if @loop_counter >= 20000
    end

    def update_disposable_board
      if @candidate_word_array = []
        # do nothing- required to skip nil error for first word
      else
        # prepares throw-away copy of board to be used when placing current word
        @candidate_word_array.each do |writetoboard|
          writetoboard.each do |writeletter|
            @disposable_board[writeletter[0]] = writeletter[1]
          end
        end
      end
    end

    def ninenines
      @list_of_ninenine = []
      @valid_spaces.each do |ninenine|
        if @disposable_board[ninenine] == 99
          @list_of_ninenine.push(ninenine)
        end
      end
    end

    def good_neighbor
      @good_neighbor_fail = 0
      @list_of_ninenine.each do |verify|
        @badneighbor = []
        @stepsall.each do |pair|
          if verify + pair == 99
            if @list_of_ninenine.include?(verify + pair)
              @badneighbor.push(verify)
            end
          end
        end
        if @badneighbor == []
          @good_neighbor_fail = 1
        end
      end
      if @good_neighbor_fail == 1
        puts "good neighbor failed"
        return false
      end
    end

    def total_bastard(word)
      @temp_letter_array = []
      @last_letter = @list_of_ninenines.sample
      @word = word.split("")
      @word_length = @word.length
      @word_length.each do |search|
        # place first letter randomly
        # then work off of the -1 array value to place all other letters
        # run other search loops if needed
      end
      # moving call of word to board here
      if word_to_board
        # do nothing
      else
        return false
      end
    end

    def word_to_board
      # coming soon

      #the last step should be to verify that the placed words in total_bastard do not leave an orphan space
      if good_neighbor
        # do nothing
      else
        return false
      end
    end

  end
