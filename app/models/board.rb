require_relative 'updater'
require_relative 'validator'
require 'pry'

class BoardSpace
  attr_reader :x, :y
  attr_accessor :letter
  def initialize(x,y)
    @x = x
    @y = y
    @letter = ""
  end
end

class Board

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

  def puzzlesplitter(board)
    tempboard = []
      xcounter = 1
    8.times do |countcols|
      outputarr = []
      ycounter = 1
      board.each do |collect|
        if collect[:x] == xcounter && collect[:y] == ycounter
          if ("a".."z").include?(collect[:letter])
            outputarr.push collect[:letter]
          end
          ycounter += 1
        end
      end
      tempboard.push outputarr
      xcounter += 1
    end
    return tempboard
  end

  def fullcol(board)
    tempboard = []
      xcounter = 1
    8.times do |countcols|
      outputarr = []
      ycounter = 1
      board.each do |collect|
        if collect[:x] == xcounter && collect[:y] == ycounter
          if ("a".."z").include?(collect[:letter])
            outputarr.push collect[:letter]
          end
          ycounter += 1
        end
      end
      if outputarr.length == 8
        tempboard.push xcounter
      end
      xcounter += 1
    end
    return tempboard
  end

  def spacereduce(neighbors)
    returnarray = []
    xval = 0
    8.times do |bim|
      temparray = []
      xval += 1
      yval = 0
      punt = 0
      8.times do |bap|
        yval += 1
        neighbors.each do |putz|
          if punt == 1
            break
          end
          if putz[:x] == xval && putz[:y] == yval
            temparray.push putz
            if putz[:letter] == " "
              punt = 1
              break
            end
          end
        end
      end
      unless temparray == []
        temparray.each do |add|
          returnarray.push add
        end
      end
    end
    return returnarray
  end

  def removeprevious(neighbors,previous,board)
    prevarray = []
    previous.each do |add|
      item = board.select { |num| num[:x] == add[0] && num[:y] == add[1]}
      prevarray.push Hash[item[0]]
    end
    prevarray.each do |moosh|
      id = neighbors.index(moosh)
      unless id == nil
        neighbors.delete_at(id)
      end
    end
    return neighbors
  end

  def neighbormover(candidate,letter,board,previous)
    neighborx = candidate[:x]
    neighbory = candidate[:y]+1
    candidatehash = board.select { |num| num[:x] == candidate[:x] && num[:y] == candidate[:y]}
    neighbor = board.select { |num| num[:x] == neighborx && num[:y] == neighbory}
    if candidatehash[0][:letter] == " "
      board.each do |overwrite|
        if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
          overwrite[:letter] = letter
        end
      end
    elsif neighbor.length == 0
        return false
    elsif previous.include?([neighbor[0][:x],neighbor[0][:y]])
      return false
    else
      nhash = Hash[ :x, neighbor[0][:x], :y, neighbor[0][:y] ]
      neighbormover(nhash,candidatehash[0][:letter],board,previous)
      board.each do |overwrite|
        if overwrite[:x] == candidatehash[0][:x] && overwrite[:y] == candidatehash[0][:y]
          overwrite[:letter] = letter
        end
      end
    end
    return [candidatehash[0][:x], candidatehash[0][:y]],board
  end

  def columnwriter(columns, board)
    tempboard = []
    xcounter = 0
    columns.each do |fill|
      if fill.length < 8
        (8 - fill.length).times do
          fill.push " "
        end
      end
    end
    8.times do
      ycounter = 0
      8.times do
        newhash = Hash[:x, xcounter+1, :y, ycounter+1, :letter, columns[xcounter][ycounter]]
        tempboard.push newhash
        ycounter += 1
      end
      xcounter += 1
    end
    return tempboard
  end

  def outputviewer(board)
    puts " "
    xval = 0
    8.times do |bim|
      xval += 1
      yval = 0
      8.times do |bap|
        yval += 1
        print "#{xval} , #{yval} :"
        board.each do |putz|
          if putz[:x] == xval && putz[:y] == yval
            print "\"#{putz[:letter]}\" "
            if yval == 8
              puts "\n"
            end
          end
        end
      end
    end
    puts "\n\n"
  end

  def firstletterinsert(letter,board)
    columns = puzzlesplitter(board)
    arrlen = 8
    until arrlen < 8 do
      arrayselect = rand(0..7)
      targetarr = columns[arrayselect]
      arrlen = targetarr.length
    end
    insertindex = rand(0..arrlen)
    targetarr.insert(insertindex, letter)
    yindex = (insertindex + 1)
    columns[arrayselect] = targetarr
    previous = [(arrayselect+1),yindex]
    columns.each do |addblank|
      (8 - addblank.length).times do |fillarr|
        addblank.push " "
      end
    end
    result = columnwriter(columns,board)
    unless result == nil
      board = result
    end
    return previous, board
  end

  def remainingletterinsert(letter,board,previous)
    prev = Hash[:x, previous[-1][0], :y, previous[-1][1]]
    letteradded = false
    neighbors = board.select { |num| ([prev[:x]].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [prev[:y]].include?(num[:y])) || ([(prev[:x]-1),(prev[:x]+1)].include?(num[:x]) && [(prev[:y]-1),(prev[:y]+1)].include?(num[:y])) }

    removefullcols = fullcol(board)
    if removefullcols.length > 0
      neighbors.each do |removefull|
        if removefullcols.include?(removefull[:x])
          id = neighbors.index(removefull)
          neighbors.delete_at(id)
        end
      end
    end
    neighbors = spacereduce(neighbors)
    neighbors = removeprevious(neighbors,previous,board)
    ddownl = board.select { |num| num[:x] == (prev[:x] - 1) && num[:y] == (prev[:y] - 2) && num[:letter] == " " }
    ddownr = board.select { |num| num[:x] == (prev[:x] + 1) && num[:y] == (prev[:y] - 2) && num[:letter] == " " }
    if ddownl != [] || ddownr != []
      return false
    # elsif ddownl != [] && prev[:x] == 8
    #   return false
    # elsif ddownr != [] && prev[:x] == 1
    #   return false
    elsif neighbors.length == 0
      return false
    else
      if neighbors.is_a?(Hash)
        result = neighbormover(neighbors,letter,board,previous)
      else
        result = neighbormover(neighbors.sample,letter,board,previous)
      end
    end
    if result == false
      return false
    else
      previous = result[0]
      board = result[1]
      return previous, board
    end

  end

  def machine(word,board)
    resultboard = board.clone
    previous = []
    wordarr = word.split("")
    counter = 0
    wordarr.each do |process|
      if counter == 0
        result = firstletterinsert(process,resultboard)
        unless result == false
          previous.push result[0]
          resultboard = result[1]
        end
      else
        result = remainingletterinsert(process,resultboard,previous)
        unless result == false
          previous.push result[0]
          resultboard = result[1]
        end
      end
      board = resultboard
      if result == false
        return false
      end
      counter += 1
    end
    # print resultboard
    # puts " "
    # print previous
    return resultboard, previous
  end

  def completecheck(board)
    wholeboard = board.select { |num| num[:letter] == " "}
    if wholeboard == []
      return 0
    else
      return 1
    end
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

  def set_words(testwords)
    solution = []
    words = []
    counter = 0
    success = 1
    gameboard = []
    @board = Board.new.board_spaces
    @board.each do |toarr|
      hash = {}
      toarr.instance_variables.each {|var| hash[var.to_s.delete("@").to_sym] = toarr.instance_variable_get(var) }
      hash[:letter] = " "
      gameboard.push hash
    end
    gameboardtwo = gameboard.clone
    until success == 0 || counter == 2000 do
      testwords.shuffle.each do |place|
        20.times do
          printing = machine(place,gameboard)
          if printing == false
            # puts "an attempt to run machine failed"
          else
            gameboard = printing[0]
            solution.push printing[1]
            words.push place
            break
          end
        end
      end
      counter += 1
      success = completecheck(gameboard)
      if success == 1
        gameboard = gameboardtwo.clone
        words = []
        solution = []
      end
    end

    if words == []
      return false
    else
      finishedboard = []
      gameboard.each do |serial|
        temparr = []
        temparr.push serial[:x]
        temparr.push serial[:y]
        temparr.push serial[:letter]
        finishedboard.push temparr
      end
      solved = Marshal.dump(solution)
      puzzle = Puzzle.new(:board => finishedboard, :words => words, :solution => solved).save
      return gameboard, words, solution
    end
  end

end
