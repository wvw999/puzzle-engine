class Updater
 # user_move values should be an array of the board objects the user selected on the game board
 # e.g. : { @letter="e", @x=1, @y=2}
  def comparison(user_move)
    @user_letters = []
    user_move.each do |letters|
      @user_letters.push(letters.letter)
    end
    if @word_list.include(@user_letters.join(""))
      board_adjuster(user_move)
    else
      return "this was not a valid move"
    end
  end

  def board_adjuster(user_move)
    # user move should be letter and x y values
    # if values == puzzle word
    # using x y values, change letter value to zero '0'
    # then call function to shift letters in case of '0' values
  end

  def board_shifter

  end

end
