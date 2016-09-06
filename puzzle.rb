# Robert Ip, CISC 3410, Program #1
class State
  @goal_state = []
  @history = []
  @board = []

  # hardcoding x and y values for calculating manhattan distance
  @onex = @oney = @twox = @threex = @foury = @seveny = 0
  @twoy = @fourx = @fivex = @fivey = @sixx = @eighty = 1
  @threey = @sixy = @sevenx = @eightx = @tenx = @teny = 2

  def initialize (board,history)
    # instance variables
    @board = board
    @history = history
    @goal_state = [[1,2,3],[4,5,6],[7,8,10]]
    @onex = @oney = @twox = @threex = @foury = @seveny = 0
    @twoy = @fourx = @fivex = @fivey = @sixx = @eighty = 1
    @threey = @sixy = @sevenx = @eightx = @tenx = @teny = 2
  end

  def isSolved
    if @board == @goal_state
      puts "IT HAS BEEN SOLVED ++++++++++++++++++++++++++++++++++++++++"
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
    for x in 0...3
      for y in 0...3
        if @board[x][y] == 10
          return [x,y]
        end
      end
    end
  end

  ## swaps the blank tile with the tile above it
  def moveDown(x,y)
   if x != 2
    puts "moving the zero down"
    @history << "down"
    @board[x][y],@board[x+1][y] = @board[x+1][y],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile below it
  def moveUp(x,y)
   if x > 0
    puts "moving the zero up"
    @history << "up"
    @board[x][y],@board[x-1][y] = @board[x-1][y],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile to its left
  def moveLeft(x,y)
   if y != 0
     puts "moving the zero left"
     @history << "left"
     @board[x][y],@board[x][y-1] = @board[x][y-1],@board[x][y]
   end
  end

  ## swaps the blank tile with the tile to its right
  def moveRight(x,y)
   if y != 2
     puts "moving the zero right"
     @history << "right"
     @board[x][y],@board[x][y+1] = @board[x][y+1],@board[x][y]
   end
  end

  # finds x and y coordinates of an element in the 2D board
  def find_index(num)
    for x in 0...3
      if @board[x].index(num) != nil
        x_coord = x
        y_coord = @board[x].index(num)
        return [x_coord,y_coord]
      end
    end
  end
  # the Manhattan distance is the sum of the absolute values of the horizontal and the vertical distance
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
    manhattan_dist_sum  = 0
    manhattan_dist_sum += get_manhattan_distance(1) + get_manhattan_distance(2) + get_manhattan_distance(3)
    manhattan_dist_sum += get_manhattan_distance(4) + get_manhattan_distance(5) + get_manhattan_distance(6)
    manhattan_dist_sum += get_manhattan_distance(7) + get_manhattan_distance(8)
    manhattan_dist_sum
  end

  # the f(n) or total cost of the current state
  # calculated by retrieving g+h
  def get_f
    get_g + get_f
  end

end
