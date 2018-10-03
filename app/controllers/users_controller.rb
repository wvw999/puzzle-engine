class UsersController < ApplicationController

  def index
    # @users = {"destination": "The secret ski lodge of the ancient weiner dogs."}
    @users = User.all
    json_response(@users)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.permit(:name, :email, :password, :admin, :hints, :score, :puzzle_id, :id)
  end

end
