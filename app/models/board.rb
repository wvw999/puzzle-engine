class BoardSpace
  attr_reader :x, :y
  attr_accessor :letter
  def initialize(x,y)
    @x = x
    @y = y
    @letter = ""
  end
end

class Board
  def set_words(words)
    @board = Board.new.board_spaces
    binding.pry
    # this_board = board_spaces.dup
    words.each do |word|
      counter = 0
      word_letters = word.split("")
      word_letter = word_letters[counter]
      until counter == word_letter.length do
        if counter == 0
          first_letter(word_letter)
        else
          remaining_letters(word_letter)
        end
        counter += 1
      end
      # similar process as TB, but with new math/logic to handle x/y coord system
      # break word into array, each over the letters
      # 1st letter random, all others located mathematically
      # will need new methods for this
      # will need place to store word letter locations as they are built
      # raise "failed on word: #{word}"
    end
  end

  # def first_letter(letter)
  #   all_empty = []
  #   @board.each do |collect|
  #     if collect.letter == ""
  #       all_empty.push(collect)
  #     end
  #   end
  #   binding.pry
  #   # for first letter, can select any open space
  #   # will need to track location of each placed letter in the word for use in subsequent step
  # end
  #
  # def remaining_letters(letter)
  #   all_ampty = []
  #   @board.each do |collect|
  #     if collect.letter = ""
  #       all_empty.push(collect)
  #     end
  #   end
  #   # for remaining letters, must be adjacent to previous letter
  #   # will need to track location of each placed letter in the word for use in subsequent step
  # end

  def display
    grouped = board_spaces.group_by { |space| space.y }
    grouped.each do |key,spaces|
      q = spaces.sort_by! { |space| space.x }
      puts q.map {|space| space.letter.to_s }.join(" ")
    end
    nil
  end

  def board_spaces
    @board_spaces ||= begin
      board_array = []
      1.upto(8).each do |x|
        1.upto(8).each do |y|
          board_array << BoardSpace.new(x,y)
        end
      end
      board_array
    end
  end

end

class Locator
 # a complete board should consist of @board containing a letter value for each instance of BoardSpace
 # as well as a list of words, thus, keep a copy of the word list supplied by builder
  def putter
    testarray = ["experimental", "undertake", "counselor", "extent", "radar", "draft", "idaho", "heron", "aims", "sick"]
    counter = 0
    begin
      @board = Board.new
      @board.set_words(test_array)
    rescue => e
      puts e.message
      counter += 1
      retry unless counter > 20
      raise e
    end
  end

end
