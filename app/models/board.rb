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
    @list_of_neighbors = ["q"]
    @candidate_word_array = []
  end

  def make_board(word_list,try_counter,board_is_complete)
    puts " "
    @board_is_complete = board_is_complete
    @try_counter = try_counter
    @word_list = word_list.sort_by(&:length).reverse
    print @word_list
    @blank_board = @empty_board.clone
    # take each word in wordlist and loop over each letter in it
    while @try_counter <= 20000 || @board_is_complete == 0 do
      #needs prep for word spaces selector
      @breaker = 0
      @word_list.each do |processword|
        @word_length = processword.split("").length
        @current_word = processword
        # begin steps of building board here by getting all 99 values on board
        # list of ninenines can work here because it happens before word spaces selector
        list_of_ninenines
        # sends word length to selector
        if word_spaces_selector
          board_updater
        else
          return fail
        end
        @blank_board = @blank_board_level_two.clone
        puts "looped, went over #{processword}"
        print @blank_board_level_two
        puts " "
        # can use ninenines here, board has been re-updated
        list_of_ninenines
        board_is_complete
      end
    end
    if @breaker == 1
      return false
    else
      return @blank_board, @try_counter, @board_is_complete, @word_list
    end
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

  def word_spaces_selector
    # each word works with its own copy of the board, to be thrown out if fail
    @blank_board_level_two = @blank_board.clone
    100.times do |justdoit|
      # each word works with its own copy of the board, to be thrown out if fail
      @blank_board_level_three = @blank_board_level_two.clone
      @selectbreaker = 0
      # binding.pry
      @sub_candidate_word_array = []
      # first step selects the first letter, it is random
      @sub_candidate_word_array.push(@list_of_ninenine.sample)
      # places the first letter of the word in the array so the loop has a -1 to work with
      @list_of_ninenine.delete(@sub_candidate_word_array[-1])
      # loops over remaining letters in word to pick neighboring spaces on board
      (@word_length - 1).times do |pickspaces|
        @list_of_neighbors = ["q"]
        #builds array of index locations in @blank_board
        @steps.each do |buildneighbors|
          binding.pry
          if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + buildneighbors)
            @list_of_neighbors.push(@sub_candidate_word_array[-1] + buildneighbors)
          end
        end
        if @list_of_neighbors.length <= 0
          # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
          stepsone
        end
        if @list_of_neighbors.length <= 0
          # if the neighbor check fails the array will be empty, look again for the +10 values using second array of plus/minus values
          stepstwo
        end
        if @list_of_neighbors.length <= 0
          # if the neighbor check fails the array will be empty, look again for everything that's left
          stepsthree
        end
        # puts " "
          #   puts "this is nine nine "
          #   print @list_of_ninenine
          #   puts " "
          #   puts "this is candidate word array "
          #   print @candidate_word_array
          #   puts " "
          #   puts "this is list of neighbors "
          #   print @list_of_neighbors
          #   puts " "
          #   puts "this is loop counter "
          #   puts @loop_counter
        # puts " "
        if @list_of_neighbors == ["q"] || @list_of_neighbors.include?(nil)
          @selectbreaker = 1
          puts "hit selectbreaker on line 111"
          next
        end
        # removes the newly selected next space on board from the array of candidates in list_of_ninenine
        @list_of_neighbors.delete("q")
        @sub_candidate_word_array.push(@list_of_neighbors.sample)
        @list_of_ninenine.delete(@sub_candidate_word_array[-1])
      end
      @candidate_word_array.push(@sub_candidate_word_array)
    end
  end

  def stepsone
    @stepsupone.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdownone.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end

  def stepstwo
    @stepsuptwo.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdowntwo.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end

  def stepsthree
    @stepsupthree.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
    @stepsdownthree.each do |addtoneighbors|
      if @list_of_ninenine.include?(@sub_candidate_word_array[-1] + addtoneighbors)
        @list_of_neighbors.push(@sub_candidate_word_array[-1] + addtoneighbors)
      end
    end
  end

  def board_updater
    #takes candidate word letter locations and adds them to the board
    @word_index = 0
    @split_word = @current_word.split("")
    @final_word_array = []
    array_cleanup
    print @blank_board_level_two
    print "\n\n"
    print @final_word_array
    print "\n\n"
    print @split_word
    print "\n\n"
    # binding.pry
    @counter_for_trys = 0
    until @counter_for_trys == @final_word_array.length || @breakertwo == 1 do
      @split_word.length.times do |update|
        puts @word_index
        @blank_board_level_two[@final_word_array[@word_index]] = @split_word[@word_index]
        @word_index += 1
      end
      @counter_for_trys += 1
    end
  end

  def array_cleanup
    @candidate_word_array.each do |cleanup|
      if cleanup.length == @word_length && cleanup.exclude?(nil)
        @final_word_array.push(cleanup)
      end
    end
  end
end
