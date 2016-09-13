# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/
class State

# reads input from text file to initiate the slider puzzle
  def read_file(file_name)
    text = File.open(file_name).read
    @board = make_board(text)
  end

  def make_board(text)
    text_arr = text.split(" ")
    new_board = Array.new
    if text.length == 9
      # make a 3 X 3 slider puzzle
    3.times{
        row = Array.new
        3.times{
          row << text.shift
        }
        new_board << row
    }
    elsif text.length == 16
      # make a 4 X 4 slider puzzle
    4.times{
        row = Array.new
        4.times{
          row << text.shift
        }
        new_board << row
    }
    end
    return new_board
  end

  def initialize(board,history)
    if board.length == 3
      return initialize_3(board,history)
    elsif board.length == 4
      return initialize_4(board,history)
    end
  end

  # initialize a 4 x 4 slider puzzle
  def initialize_4 (board,history)
    # instance variables
    @board = board
    @history = history
    @goal_state = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]
    @onex = @twox = @threex = @foury = @eighty = @twelvey = 0
    @oney = @fourx = @fivex = @fivey = @sixx = @sevenx = @niney = @thirteeny = 1
    @twoy = @sixy = @eightx = @ninex = @tenx = @teny = @elevenx = @fourteeny = 2
    @threey = @seveny = @eleveny = @twelvex = @thirteenx = @fourteenx = @fifteenx = @fifteeny = 3
  end

  # initialize a 3 x 3 slider puzzle
  def initialize_3 (board,history)
    # instance variables
    @board = board
    @history = history
    @goal_state = [[0,1,2],[3,4,5],[6,7,8]]
    @onex = @twox = @threey = @sixy = 0
    @oney = @threex = @fourx = @foury = @fivex = @seveny = 1
    @twoy = @fivey = @sevenx = @eightx = @sixx = @eighty = 2
  end

  def isSolved
    if @board == @goal_state
      puts "Solved in " << count_moves.to_s << " moves"
    end
    @board == @goal_state
  end

  def display_board
    p @board
  end

  def display_history
   p @history
  end

  def count_moves
    puts "Number of tiles moved: " << @history.length.to_s
    @history.length
  end

  def get_board
    @board
  end

  def get_history
    @history
  end

  # returns the location of the blank tile
  def index_zero
    for x in 0...@board.length
      for y in 0...@board.length
        if @board[x][y] == 0
          return [x,y]
        end
      end
    end
  end

  ## swaps the blank tile with the tile above it
  def moveDown(x,y)
   if x != @board.length-1
    @history << "down"
    @board[x][y],@board[x+1][y] = @board[x+1][y],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile below it
  def moveUp(x,y)
   if x > 0
    @history << "up"
    @board[x][y],@board[x-1][y] = @board[x-1][y],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile to its left
  def moveLeft(x,y)
   if y != 0
     @history << "left"
     @board[x][y],@board[x][y-1] = @board[x][y-1],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile to its right
  def moveRight(x,y)
   if y != @board.length-1
     @history << "right"
     @board[x][y],@board[x][y+1] = @board[x][y+1],@board[x][y]
   end
  end

  # finds x and y coordinates of an element in the 2D board
  def find_index(num)
    for x in 0...@board.length
      if @board[x].index(num) != nil
        x_coord = x
        y_coord = @board[x].index(num)
        return [x_coord,y_coord]
      end
    end
  end

  # the Manhattan distance is the sum of the absolute values of the horizontal and the vertical distance
  # for a 3 x 3 board
  def get_manhattan_distance(num)
    case num
    when 1
      coords = find_index(1)
      return (coords[0]-@onex).abs + (coords[1]-@oney).abs
    when 2
      coords = find_index(2)
      return (coords[0]-@twox).abs + (coords[1]-@twoy).abs
    when 3
      coords = find_index(3)
      return (coords[0]-@threex).abs + (coords[1]-@threey).abs
    when 4
      coords = find_index(4)
      return (coords[0]-@fourx).abs + (coords[1]-@foury).abs
    when 5
      coords = find_index(5)
      return (coords[0]-@fivex).abs + (coords[1]-@fivey).abs
    when 6
      coords = find_index(6)
      return (coords[0]-@sixx).abs + (coords[1]-@sixy).abs
    when 7
      coords = find_index(7)
      return (coords[0]-@sevenx).abs + (coords[1]-@seveny).abs
    when 8
      coords = find_index(8)
      return (coords[0]-@eightx).abs + (coords[1]-@eighty).abs
    when 9
      coords = find_index(9)
      return (coords[0]-@ninex).abs + (coords[1]-@niney).abs
    when 10
      coords = find_index(10)
      return (coords[0]-@tenx).abs + (coords[1]-@teny).abs
    when 11
      coords = find_index(11)
      return (coords[0]-@elevenx).abs + (coords[1]-@eleveny).abs
    when 12
      coords = find_index(12)
      return (coords[0]-@twelvex).abs + (coords[1]-@twelvey).abs
    when 13
      coords = find_index(13)
      return (coords[0]-@thirteenx).abs + (coords[1]-@thirteeny).abs
    when 14
      coords = find_index(14)
      return (coords[0]-@fourteenx).abs + (coords[1]-@fourteeny).abs
    when 15
      coords = find_index(15)
      return (coords[0]-@fifteenx).abs + (coords[1]-@fifteeny).abs
    end

  end

  # returns the g(n) part of the cost function, which is the amount of steps
  # that the curreet state it at
  def get_g
    @history.length
  end

  # returns the h(n) part of the cost function
  # uses the Manhattan distance to approximate the number of moves needed to solve the puzzle
  def get_h
    if @board.length == 3
      return get_manhattan_distance(1) + get_manhattan_distance(2) + get_manhattan_distance(3) +
      get_manhattan_distance(4) + get_manhattan_distance(5) + get_manhattan_distance(6) +
      get_manhattan_distance(7) + get_manhattan_distance(8)
    elsif @board.length == 4
      return get_manhattan_distance(1) + get_manhattan_distance(2) + get_manhattan_distance(3) +
      get_manhattan_distance(4) + get_manhattan_distance(5) + get_manhattan_distance(6) +
      get_manhattan_distance(7) + get_manhattan_distance(8) +
      get_manhattan_distance(9) + get_manhattan_distance(10) + get_manhattan_distance(11) +
      get_manhattan_distance(12) + get_manhattan_distance(13) + get_manhattan_distance(14) +
      get_manhattan_distance(15)
    end
  end

  # the f(n) or total cost of the current state
  # calculated by retrieving g+h
  def get_f
    get_g + get_h
  end
end
