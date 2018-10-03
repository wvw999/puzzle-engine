class Board

  def initialize
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @steps = [-11, -10, -9, -1, 1, 9, 10, 11]
    @stepsdown = [-21, -20, -19]
    @stepsup = [19, 20, 21]
  end

  # clones board and attempts to place each letter on board
  def make_board(wordlist)
    @restart_loop = 0
    @loop_counter = 0
    loop_manager(wordlist)
  end

  def loop_manager(wordlist)
    @blank_board = @empty_board.clone
    wordlist.each do |word|
      list_of_ninenines
      word_spaces_loop(word.length)
      update_blank_board(word)
    end
  end

  # builds list of 99 values on board at the beginning of each word placement loop
  def list_of_ninenines
    @list_of_ninenine = []
    @valid_spaces.each do |ninenine|
      if @blank_board[ninenine] == 99
        @list_of_ninenine.push(ninenine)
      end
    end
  end

  # at the end of this loop, should have an array with word.length number of board index locations inside
  def word_spaces_loop(length_of_word)
    @candidate_word_array = []
    @candidate_word_array.push(@list_of_ninenine.sample)
    # places the first letter of the word in the array so the loop has a -1 to work with
    @list_of_ninenine.delete(@candidate_word_array[-1])

    (length_of_word-1).times do |pickspaces|
      @list_of_neighbors = []

      #builds array of index locations in @blank_board
      @steps.each do |buildneighbors|
        if @list_of_ninenine.include?(@candidate_word_array[-1] + buildneighbors)
          @list_of_neighbors.push(@candidate_word_array[-1] + buildneighbors)
        end
      end

      #removes the newly selected next space on board from the array of candidates in list_of_ninenine
      if @list_of_neighbors.length > 0
        @candidate_word_array.push(@list_of_neighbors.sample)
        @list_of_ninenine.delete(@candidate_word_array[-1])
      elsif @list_of_ninenine > 0
        # if the neighbor check fails, look again for the +10 values using second array of plus/minus values


      else
        @restart_loop = 1
        @loop_counter += 1
        binding.pry
      end
    end

  end

  # takes the candidate word array and adds the letters from the word to the board
  def update_blank_board(word)
    word_letters = word.split("")
    word_length = word.length
    word_index = 0
    word_length.times do |updateboard|
      @blank_board[@candidate_word_array[word_index]] = word_letters[word_index]
      word_index += 1
    end
  end

end
