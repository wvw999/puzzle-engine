class PlaysController < ApplicationController

  def index
    @plays = Play.all
    json_response(@plays)
  end

  def show
    @play = Play.find(params[:id])
    json_response(@play)
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.create!(play_params)
    json_response(@play, :created)
  end

  def update
    @play = Play.find(params[:id])
    @play.update!(play_params)
  end

  def destroy
    @play = Play.find(params[:id])
    @play.destroy
  end

  private
  def play_params
    params.permit(:user_id, :puzzle_id, :puzzle_current, :found_words, :remaining_words, :play_counts, :reward_hints,  :id)
  end

end
