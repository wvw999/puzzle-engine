class PuzzlesController < ApplicationController

  def index
    400.times do
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
    end
    json_response(@complete)
  end

  def show
    @poop = "poop"
    @puzzle = Puzzle.find(params[:id])
    @validator = Validator.new
    @board = @puzzle.board
    @words = @puzzle.words
    @solution = Marshal.load(@puzzle.solution)
    @solved = 0
    @dump = [@board, @words, @solution]
    goodpuzzle = @validator.solver_engine(@words, @board, @solution)
    if goodpuzzle == 1
      json_response(@dump)
    else
      @puzzle.destroy
      json_response(@poop)
    end
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
