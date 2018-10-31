class PuzzlesController < ApplicationController

  def index
    @builder = Builder.new
    @wordlist = @builder.initial_word_puller
    @board = Board.new
    @complete = @board.set_words(["experimental", "undertake", "counselor", "extent", "radar", "draft", "idaho", "heron", "aims", "sick"])
    binding.pry
    json_response(@complete)
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
