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

      # raise "failed on word: #{word}"
    end
  end

  def first_letter(letter)
    all_empty = []
    @board.each do |collect|
      if collect.letter == ""
        all_empty.push(collect)
      end
    end
    
  end

  def remaining_letters(letter)

  end

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

  def putter
    testarray = ["experimental", "undertake", "counselor", "extent", "aims", "radar", "draft", "sick", "idaho", "heron"]
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
