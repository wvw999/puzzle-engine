class PuzzlesController < ApplicationController

  def index
    # @destinations = {"destination": "The secret ski lodge of the ancient weiner dogs."}
    # @puzzles = Puzzle.all
    # json_response(@puzzles)
    @builder = Builder.new
    @wordlist = @builder.initial_word_puller
    @try_counter = 0
    @board_complete = 0
    while @try_counter <= 20000 || @board_complete == 0 do
      @board = Board.new
      @complete = @board.make_board(@wordlist, @try_counter, @board_complete)
      @try_counter = @complete[1]
      @board_complete = @complete[2]
    end
    json_response(@complete[0])
    # binding.pry
  end

  def show
    @puzzle = Puzzle.find(params[:id])
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
    params.permit(:board, :words, :id)
  end

end
