class Board

  def initialize
    @valid_spaces = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 51, 52, 53, 54, 55, 56, 57, 58, 61, 62, 63, 64, 65, 66, 67, 68, 71, 72, 73, 74, 75, 76, 77, 78, 81, 82, 83, 84, 85, 86, 87, 88]
    @empty_board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 1, 99, 99, 99, 99, 99, 99, 99, 99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @steps = [[-11, -10, -9, -1, 1, 9, 10, 11],[-19, -20, -21, 19, 20, 21],[-29, -30, -31, 29, 30, 31],[-39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]]
    @stepsall = [-11, -10, -9, -1, 1, 9, 10, 11, -19, -20, -21, 19, 20, 21, -29, -30, -31, 29, 30, 31, -39, -40, -41, -49, -50, -51, -59, -60, -61, -69, -70, -71, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71]
    @try_counter = 0
    @list_of_neighbors = []
    @candidate_word_array = []
  end

  def make_board(word_list)
    @complete_board = @empty_board.clone
    puts "this is word list"
    print word_list
    puts " "
    word_list.each do |placement|
      success = 0
      while success == 0 do
        @disposable_board = @complete_board.clone
        # disposable board should be a running record of the successfully placed words
        ninenines
        puts "this is disposable board before TB"
          print @disposable_board
          puts " "
          puts "ninenines in make board loop for disposable"
          print @list_of_ninenines
          puts " "
          total_bastard(placement)
          puts "this is temp letter array after TB has run"
          print @temp_letters_array
          puts " "
          @candidate_word_array.push(@temp_letters_array)
          puts "this is candidate word array after pushing temp letter array to it"
          print @candidate_word_array
          puts " "
          @complete_board = @disposable_board.clone
          puts "this is disposable board after TB"
          print @disposable_board
          puts " "
        puts " "
        success = 1
        break if @try_counter >= 20000
      end
      if @try_counter >= 20000
        puts "loop caounter cantaloper beep boop"
        break
      end
    end
    return @candidate_word_array, @complete_board
  end

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
        if @list_of_ninenines.include?(verify + pair)
          @neighbor.push(verify)
        end
      end
      # if any value in @list_of_ninenine has no neighbors, fail good_neighbor
      if @neighbor == []
        @good_neighbor_fail = 1
      end
    end
    if @good_neighbor_fail == 1
      puts "*****\n*****\ngood neighbor was false\n*****\n*****"
      @good_neighbor_fail = 0
      return false
    else
      return true
    end
  end

  def total_bastard(word)
    @word_letters_array = word.split("")
    @word_length = @word_letters_array.length
    @word_success = 0
    @word_try_counter = 0
    @bip = 0
    @temp_letters_array = []
    while @word_success == 0
      catch :didnot do
        @word_letters_array.each do |searchy|
          @searchy = searchy
          @try_counter += 1
          if @temp_letters_array != []
            word_to_board
          end
          ninenines
          if @word_try_counter == 1
            puts "here is ninenines inside of TB"
            print @list_of_ninenines
            puts " "
          end
          if @temp_letters_array == []
            @temp_letters_array.push([@list_of_ninenines.sample, @searchy])
            word_to_board
            @kick_neighbor = good_neighbor
            if @kick_neighbor == false
              puts " *** good neighbor fail on #{word} ***"
              @temp_letters_array = []
              puts "***\ntrying catch throw in if branch\n***"
              @bip = 1
              throw :didnot
            else
              @list_of_ninenines.delete(@temp_letters_array[-1][0])
            end
          else
            @current_space = @temp_letters_array[-1][0]
            @list_of_neighbors = []
            @pushed = 0
            @steps.each do |buildneighbors|
              @temp_array = []
              buildneighbors.each do |internals|
                if @list_of_ninenines.include?(@current_space + internals)
                  @temp_array.push(@current_space + internals)
                end
              end
              @list_of_neighbors.push(@temp_array)
            end
            if @word_try_counter == 1
              puts "here is list of neighbors"
              print @list_of_neighbors
              puts " "
              puts "here it temp letters areray"
              print @temp_letters_array
              puts " "
            end
            if @list_of_neighbors == [[],[],[],[]]
              puts "list of neighbors came up blank. crap."
              break
            else
              @list_of_neighbors.each do |lookupone|
                if @pushed == 0
                  if lookupone == []
                    # puts "list of neighbors lookupone == [].\ntrying to place #{word}, should be skipping to next block in array"
                    break
                  else
                    @temp_letters_array.push([lookupone.sample, @searchy])
                    if @word_try_counter == 1
                      puts "temp letters array"
                      print @temp_letters_array[-1]
                      puts " "
                    end
                    @pushed = 1
                  end
                end
              end
            end
            word_to_board
            @kick_neighbor = good_neighbor
            if @kick_neighbor == false
              @temp_letters_array = []
              puts "trying catch throw in else branch"
              @bip = 1
              throw :didnot
            else
              @list_of_ninenines.delete(@temp_letters_array[-1][0])
            end
          end
        end
        if @temp_letters_array.length == @word_letters_array.length
          puts "***********************************\nword letters array inside TB loops, shuld be success here\n***********************************************"
          print @word_letters_array
          puts " "
          @word_success = 1
        end
      end
      puts "attempted to place #{word}, here is, list of neighbors, temp array, list of ninenines, complete board"
        print @list_of_neighbors
        puts " "
        print @temp_letters_array
        puts " "
        print @list_of_ninenines
        puts " "
        print @disposable_board
      puts " "
    end
  end

  # should only take the current word's letters and place the letters in temp_letters_array on disposable_board
  def word_to_board
    # update temp board with current word letters.
    @temp_letters_array.each do |validating|
      # puts "this is 'validating' inside of word to board"
      # print validating
      # puts " "
      @disposable_board[validating[0]] = validating[1]
    end
  end

end
