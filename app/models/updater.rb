require_relative 'board'

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
    # adds only Y values which contain a letter to an array, hands off to column writer
    @xvalue = 1
    8.times do |shifty|
      @column = @board.select { |board_space| board_space.x=@xvalue && board_space.letter!=0 }
      unless @column.length == 0 || @column.length == 8 do
        column_writer(@column)
      end
      @xvalue += 1
    end
  end

  def column_writer(column)
    # builds new array of zeroes, then letters, writes to board 
    @new_column = []
    @procesing = 8 - column.length
    # writes the appropriate number of zeroes into the new column array
    @processing.times do |write_zero|
      @new_column.push(0)
    end
    # processes the column data, putting letters into new column array in correct order
    column.each do |letters|
      8.downto(1) do |write_letter|
        if letters.y == write_letter
          @new_column.push(letters.letter)
        end
      end
    end
    # writes new column to board from new column array
    @step = 9
    @new_column.each do |update_column|
      @step -= 1
      @location = @board.select { |board_location| board_location.x=@xvalue && board_location.y=@step}
      @location.letter = update_column.letter
    end
  end

end
