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
    json_response(@complete)
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    # adding in validator here for testing
    @solution = Validator.new
    @board = @puzzle.board
    @words = @puzzle.words
    @solution = []
    @solved = 0
    @working = solution_processor(@board, @words, @solution, @solved)
    json_response(@puzzle)
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
