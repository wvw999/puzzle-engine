require_relative 'updater'
require 'json'

class BoardSpace
  attr_reader :x, :y
  attr_accessor :letter
  def initialize(x,y)
    @x = x
    @y = y
    @letter = ""
  end
end

class Board # < ActiveRecord::Base
  #serialize :boardstate
  def set_words(words)
    @board = Board.new.board_spaces
    @placed = {}
    words.each do |word|
      @counter = 0
      word_letters = word.split("")
      # puts word
      until @counter == word_letters.length do
        word_letter = word_letters[@counter]
        if @counter == 0
          first_letter(word,word_letter)
        else
          remaining_letters(word,word_letter)
        end
        # puts @counter
        @counter += 1
      end
    end
    @nope = 0
    @placed.each do |key,val|
      if key.to_s.split("").length != val.length
        @nope += 1
      end
    end
    if @nope == 0
      # commenting out code that writes new puzzles to DB since DB now has 2000+ puzzles stored in it
      # @boardpackage = []
      # @board.each do |serialize|
      #   boardspace = []
      #   boardspace.push serialize.x
      #   boardspace.push serialize.y
      #   boardspace.push serialize.letter
      #   @boardpackage.push boardspace
      # end
      # puzzle = Puzzle.new(:board => @boardpackage, :words => words).save
      puzz = Puzzle.find(100)
      binding.pry
      return [@board , words] #, @placed]
    else
      return false
    end
  end

  def first_letter(word,letter)
    @all_empty = []
    @board.each do |collect|
      if collect.letter == ""
        @all_empty.push(collect)
      end
    end
    location = @all_empty.sample
    location.letter = letter
    @placed[word] = [[location.letter, location.x, location.y]]
  end

  def remaining_letters(word,letter)
    @last_x = @placed[word].last[1]
    @last_y = @placed[word].last[2]
    @last_empty = []
    @second = 1

    until @second > 8 do
      if @last_empty == []
        @board.each do |locate|
          if locate.letter == "" && [@last_x, @last_x + 1, @last_x - 1].include?(locate.x) && [@last_y, @last_y + @second, @last_y - @second].include?(locate.y)
            @last_empty.push(locate)
          end
        end
      else
        @second = 9
      end
      @second += 1
    end

    if @second > 8 && @last_empty == []
      return false
    end
    location = @last_empty.sample
    location.letter = letter
    @placed[word] << [location.letter, location.x, location.y]
  end

  def display
    grouped = board_spaces.group_by { |space| space.y }
    grouped.each do |key,spaces|
      q = spaces.sort_by! { |space| space.x }
      puts q.map {|space| space.letter.to_s }.join(" ")
    end
    nil
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

end
