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

  def make_board(wordlist,try_counter,board_complete)
    @board_is_complete = board_complete
    @try_counter = try_counter
    @word_list = wordlist
    @blank_board = @empty_board.clone
    # take each word in wordlist and loop over each letter in it
    while @try_counter <= 20000 || @board_is_complete == 0 do
      #needs prep for word spaces selector
      @word_list.each do |processword|
        # begin steps of building board here by getting all 99 values on board
        list_of_ninenines
        # sends word length to selector
        word_spaces_selector(processword.split("").length)
        # sends completed word to board_updater
        board_updater
      end
    end
    return @blank_board, @try_counter, @board_is_complete
  end

  def board_is_complete
    if list_of_ninenines == [] || @try_counter >= 20000
      @board_is_complete = 1
      @word_loop_counter = 20000
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

  def word_spaces_selector(lengthofword)
    # nasty mess here
    @candidate_word_array = []
    @candidate_word_array.push(@list_of_ninenine.sample)
    @list_of_ninenine.delete(@candidate_word_array[-1])

  end

  def board_updater
    #takes candidate word letter locations and adds them to the board

    list_of_ninenines
    board_is_complete
  end

  # # runs through the steps needed to place one word on the board, loops over all words
  # def loop_manager(wordlist)
  #   wordlist.each do |word|
  #     puts " "
  #     puts word
  #     list_of_ninenines
  #     word_spaces_loop(word.length)
  #     puts "updating blank board with word: "
  #     puts word
  #     unless @list_of_neighbors == []
  #       update_blank_board(word)
  #     end
  #   end
  # end
  #
  # # builds list of 99 values on board at the beginning of each word placement loop
  # def list_of_ninenines
  #   @list_of_ninenine = []
  #   @valid_spaces.each do |ninenine|
  #     if @blank_board[ninenine] == 99
  #       @list_of_ninenine.push(ninenine)
  #     end
  #   end
  # end
  #
  # # at the end of this loop, should have an array with word.length number of board index locations inside
  # def word_spaces_loop(length_of_word)
  #   @candidate_word_array = []
  #   @candidate_word_array.push(@list_of_ninenine.sample)
  #   # places the first letter of the word in the array so the loop has a -1 to work with
  #   @list_of_ninenine.delete(@candidate_word_array[-1])
  #
  #   (length_of_word-1).times do |pickspaces|
  #     @list_of_neighbors = []
  #
  #     #builds array of index locations in @blank_board
  #     @steps.each do |buildneighbors|
  #       if @list_of_ninenine.include?(@candidate_word_array[-1] + buildneighbors)
  #         if (@candidate_word_array[-1] + buildneighbors) != nil
  #           @list_of_neighbors.push(@candidate_word_array[-1] + buildneighbors)
  #         end
  #       end
  #       print buildneighbors
  #       print ", "
  #     end
  #     if @list_of_ninenine.length >= 0
  #       # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
  #       @stepsupone.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #       @stepsdownone.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #     end
  #     if @list_of_ninenine.length >= 0
  #       # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
  #       @stepsuptwo.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #       @stepsdowntwo.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #     end
  #     if @list_of_ninenine.length >= 0
  #       # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
  #       @stepsupthree.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #       @stepsdownthree.each do |addtoneighbors|
  #         if @list_of_ninenine.include?(@candidate_word_array[-1] + addtoneighbors)
  #           if (@candidate_word_array[-1] + addtoneighbors) != nil
  #             @list_of_neighbors.push(@candidate_word_array[-1] + addtoneighbors)
  #           end
  #         end
  #       end
  #     end
  #     puts " "
  #     puts "this is nine nine "
  #     print @list_of_ninenine
  #     puts " "
  #     puts "this is candidate word array "
  #     print @candidate_word_array
  #     puts " "
  #     puts "this is list of neighbors "
  #     print @list_of_neighbors
  #     puts " "
  #     puts "this is loop counter "
  #     puts @loop_counter
  #     puts " "
  #
  #     # removes the newly selected next space on board from the array of candidates in list_of_ninenine
  #     @candidate_word_array.push(@list_of_neighbors.sample)
  #     @list_of_ninenine.delete(@candidate_word_array[-1])
  #   end
  #   @loop_counter += 1
  # end
  #
  # # takes the candidate word array and adds the letters from the word to the board
  # def update_blank_board(word)
  #   word_letters = word.split("")
  #   word_length = word.length
  #   word_index = 0
  #   word_length.times do |updateboard|
  #     puts "\nthis is blank board"
  #     print @blank_board
  #     puts "this is candidate word array"
  #     print @candidate_word_array
  #     @blank_board[@candidate_word_array[word_index]] = word_letters[word_index]
  #     word_index += 1
  #   end
  # end

end
