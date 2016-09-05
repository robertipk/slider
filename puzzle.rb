# Robert Ip

class State
  @goal_state = []
  @history = []
  @board = []

  # hardcoding x and y values for calculating manhattan distance
  1x = 1y = 2x = 3x = 4y = 7y = 0
  2y = 4x = 5x = 5y = 6x = 8y = 1
  3y = 6y = 7x = 8x = 10x = 10y = 2



  def initialize (board,history)
    # instance variables
    @board = board
    @history = history
    @goal_state = [[1,2,3],[4,5,6],[7,8,10]]
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

  # calculates te heuristic using the sum of the Manhattan Distance of each tile
  # from where it currently is in the state to where it should be in the goal state
  def get_heuristic
    manhattan_dist_sum  = 0
    manhattan_dist_sum += get_manhattan_distance(1) + get_manhattan_distance(2) + get_manhattan_distance(3)

    manhattan_dist_sum
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

      return
    when 2
    when 3
    when 4
    when 5
    when 6
    when 7
    when 8
    when 9
    when 10
    end
    # 1x = 1y = 2x = 3x = 4y = 7y = 0
    # 2y = 4x = 5x = 5y = 6x = 8y = 1
    # 3y = 6y = 7x = 8x = 10x = 10y = 2
    manhattan_dist  = 0

    manhattan_dist
  end


end
