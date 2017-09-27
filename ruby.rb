# Minesweeper
# The game board is n by n tiles, where n is user defined
# It contains m mines, where m is user defined, mines are randomly placed
# For each tile that does not have a mine, there is a value corresponding to the number of adjacent mines
# A mine is adjacent if it touches a tile by either it's side or it's corner (8 touch points)
# Tiles are either hidden or revealed
# Tiles can be marked and unmarked, marks are used to indicate a tile has a bomb under it
# When a hidden tile is uncovered it will do one of the following:
# If the tile has no adjacent mines, it will uncover all adjacent tiles
# If the tile has any adjacent mines, it will display the number representing adjacent mines
# If the tile is a mine, the game ends - you lose!
# Marking all the mines and uncovering all tiles ends the game - you win!
require 'pry'
class Minesweeper

  def initialize(n, m)
    @num_of_tiles = n
    @num_of_mine = m
    create_board
    insert_mines
    placing_mines
  end
# Making start to the game:
  def start
  puts "====================================================================="
  puts "Hello!  Welcome to a command line version of the classic Hangman."
  print "Please type 'number of row' you want in your board "
  choice = gets.chomp
  choose_game(choice)
  end

  def create_board
    @board = [ ]
    @num_of_tiles.times do
      arr = []
      @num_of_tiles.times do
        arr << 0
      end
      @board << arr
    end
  end

  def print_board
    @board.each do |ele|
      print "#{ele}\n"
    end
  end
#  Where the mine should go
def insert_mines
  @random_spots = []
  @num_of_mine.times do

    while @random_spots.length < @num_of_mine
      rand_num = Random.rand(@num_of_tiles**2)

      if !@random_spots.include?(rand_num)
        @random_spots << rand_num
      end

    end
  end
end

# Lets try to place the mines on board
  def placing_mines
    @count = 0
    @board.each.with_index do |ele,idx1|
      ele.each.with_index do |postion,idx2|
        @count+= 1
        if @random_spots.include?(@count)
           @board[idx1][idx2] = 1
        end
      end

    end
       print_board
  end

end

player = Minesweeper.new(5,2)
