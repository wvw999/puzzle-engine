class BoardSpace
  attr_reader :x, :y
  attr_accessor :letter
  def initialize(x,y)
    @x = x
    @y = y
    @letter = "Q"
  end
end

class Board
  def set_words(words)
    this_board = board_spaces.dup
    words.each do |word|


      raise "failed on word: #{word}"
    end
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
