class PuzzlesController < ApplicationController

  def index
    @builder = Builder.new
    @wordlist = @builder.initial_word_puller
    @board = Board.new
    @counter = 0
    until @counter > 20 do
      @complete = @board.set_words(@wordlist)
      if @complete != false
        @counter = 20
      end
      @counter += 1
    end
    # @mess = json_response(@complete)
    # print @complete
    # @cleaned = JSON.parse(@mess)
    # print @mess
    # @board = @cleaned[0].delete '\\'
    # puzzle = Puzzle.new(:board => @board, :words => @cleaned[1]).save
    # @mess
    json_response(@complete)
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    # adding in validator here for testing
    #@solution = Validator.new
    # bop = @puzzle.board[2..-3]
    # bip = bop.gsub!(/[\]*/, "\\")
    # binding.pry
    # @board = Marshal.load(bip)
    @board = @puzzle.board
    @words = @puzzle.words
    @solution = Marshal.load(@puzzle.solution)
    @solved = 0
    @dump = [@board, @words, @solution]
    #@working = solution_processor(@board, @words, @solution, @solved)

    json_response(@dump)
    # gameboard = [{:x=>1, :y=>1, :letter=>"b"}, {:x=>1, :y=>2, :letter=>"a"}, {:x=>1, :y=>3, :letter=>"r"}, {:x=>1, :y=>4, :letter=>"n"}, {:x=>1, :y=>5, :letter=>"s"}, {:x=>1, :y=>6, :letter=>"e"}, {:x=>1, :y=>7, :letter=>"t"}, {:x=>1, :y=>8, :letter=>"a"}, {:x=>2, :y=>1, :letter=>"w"}, {:x=>2, :y=>2, :letter=>"o"}, {:x=>2, :y=>3, :letter=>"i"}, {:x=>2, :y=>4, :letter=>"l"}, {:x=>2, :y=>5, :letter=>"e"}, {:x=>2, :y=>6, :letter=>"r"}, {:x=>2, :y=>7, :letter=>"r"}, {:x=>2, :y=>8, :letter=>"t"}, {:x=>3, :y=>1, :letter=>"l"}, {:x=>3, :y=>2, :letter=>"n"}, {:x=>3, :y=>3, :letter=>"n"}, {:x=>3, :y=>4, :letter=>"t"}, {:x=>3, :y=>5, :letter=>"r"}, {:x=>3, :y=>6, :letter=>"p"}, {:x=>3, :y=>7, :letter=>"i"}, {:x=>3, :y=>8, :letter=>"b"}, {:x=>4, :y=>1, :letter=>"o"}, {:x=>4, :y=>2, :letter=>"t"}, {:x=>4, :y=>3, :letter=>"y"}, {:x=>4, :y=>4, :letter=>"i"}, {:x=>4, :y=>5, :letter=>"u"}, {:x=>4, :y=>6, :letter=>"y"}, {:x=>4, :y=>7, :letter=>"o"}, {:x=>4, :y=>8, :letter=>"n"}, {:x=>5, :y=>1, :letter=>"c"}, {:x=>5, :y=>2, :letter=>"i"}, {:x=>5, :y=>3, :letter=>"r"}, {:x=>5, :y=>4, :letter=>"t"}, {:x=>5, :y=>5, :letter=>"b"}, {:x=>5, :y=>6, :letter=>"i"}, {:x=>5, :y=>7, :letter=>"t"}, {:x=>5, :y=>8, :letter=>"k"}, {:x=>6, :y=>1, :letter=>"b"}, {:x=>6, :y=>2, :letter=>"o"}, {:x=>6, :y=>3, :letter=>"e"}, {:x=>6, :y=>4, :letter=>"i"}, {:x=>6, :y=>5, :letter=>"l"}, {:x=>6, :y=>6, :letter=>"s"}, {:x=>6, :y=>7, :letter=>"o"}, {:x=>6, :y=>8, :letter=>"n"}, {:x=>7, :y=>1, :letter=>"o"}, {:x=>7, :y=>2, :letter=>"e"}, {:x=>7, :y=>3, :letter=>"h"}, {:x=>7, :y=>4, :letter=>"t"}, {:x=>7, :y=>5, :letter=>"b"}, {:x=>7, :y=>6, :letter=>"e"}, {:x=>7, :y=>7, :letter=>"h"}, {:x=>7, :y=>8, :letter=>"p"}, {:x=>8, :y=>1, :letter=>"a"}, {:x=>8, :y=>2, :letter=>"t"}, {:x=>8, :y=>3, :letter=>"u"}, {:x=>8, :y=>4, :letter=>"c"}, {:x=>8, :y=>5, :letter=>"o"}, {:x=>8, :y=>6, :letter=>"l"}, {:x=>8, :y=>7, :letter=>"h"}, {:x=>8, :y=>8, :letter=>"e"}]
    # solution = [[[6, 1], [7, 1], [8, 1], [8, 2], [8, 3]], [[1, 1], [1, 2], [1, 3], [1, 4]], [[1, 5], [2, 4], [2, 3], [2, 2], [3, 1], [4, 1]], [[5, 1], [4, 1], [3, 2], [4, 2], [3, 3], [4, 4], [3, 4], [4, 5], [5, 4], [5, 3], [6, 2], [6, 3]], [[7, 1], [8, 2], [7, 3], [6, 3], [5, 3]], [[7, 4], [8, 4], [7, 5], [8, 6]], [[2, 3], [3, 3], [3, 4], [2, 5], [2, 6], [3, 6], [2, 7], [1, 6], [1, 7], [1, 8], [2, 8], [3, 7], [4, 6], [4, 7]], [[7, 4], [8, 5], [7, 5], [6, 4], [5, 5], [6, 5], [5, 6]], [[8, 3], [7, 4], [6, 4], [6, 5], [5, 6], [5, 7], [4, 6]]]
    # words = ["beach", "barn", "slowly", "contribution", "other", "hope", "interpretation", "blesbok", "utility"]
    #
    # puts " "
    # print gameboard
    # puts " "
    # print solution
    # puts " "
    # print words
    # finishedboard = []
    # gameboard.each do |jerkface|
    #   temparr = []
    #   temparr.push jerkface[:x]
    #   temparr.push jerkface[:y]
    #   temparr.push jerkface[:letter]
    #   finishedboard.push temparr
    # end
    # solved = Marshal.dump(solution)
    # puzzle = Puzzle.new(:board => finishedboard, :words => words, :solution => solved).save
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = Puzzle.create!(puzzle_params)
    json_response(@puzzle, :created)
  end

  def update
    @puzzle = Puzzle.find(params[:id])
    @puzzle.update!(puzzle_params)
  end

  def destroy
    @puzzle = Puzzle.find(params[:id])
    @puzzle.destroy
  end

  private
  def puzzle_params
    params.permit(:board, :solution, :words, :id)
  end

end
