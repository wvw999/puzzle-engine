class Board

  def initialize
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @steps = [-11, -10, -9, -1, 1, 9, 10, 11]
    @stepsdownone = [-19, -20, -21]
    @stepsupone = [19, 20, 21]
    @stepsdowntwo = [-29, -30, -31]
    @stepsuptwo = [29, 30, 31]
    @stepsdownthree = [-39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71]
    @stepsupthree = [39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]
    @loop_counter = 1
    @list_of_neighbors = []
  end

  # begins process
  def make_board(wordlist)
    @word_list = wordlist
    @blank_board = @empty_board.clone
    list_of_ninenines
    until @loop_counter == 200 || @list_of_ninenine.length == 0
      loop_manager(wordlist)
    end
    return @blank_board
  end

  # runs through the steps needed to place one word on the board, loops over all words
  def loop_manager(wordlist)
    wordlist.each do |word|
      puts " "
      puts word
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
      print @list_of_neighbors
      puts " "
      puts @loop_counter
      puts " "
      if @list_of_ninenine.length >= 0
        # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
        @stepsupone.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
        @stepsdownone.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
      end
      if @list_of_ninenine.length >= 0
        # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
        @stepsuptwo.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
        @stepsdowntwo.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
      end
      if @list_of_ninenine.length >= 0
        # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
        @stepsupthree.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
        @stepsdownthree.each do |addtoneighbors|
          if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
            @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
          end
        end
      end

      # removes the newly selected next space on board from the array of candidates in list_of_ninenine
      @candidate_word_array.push(@list_of_neighbors.sample)
      @list_of_ninenine.delete(@candidate_word_array[-1])
    end
    @loop_counter += 1
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
