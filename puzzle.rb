# Robert Ip

class State
  @goal_state = [[1,2,3],[4,5,6],[7,44,10]]
  @history = []
  @board = []

  def initialize (board,history)
    # instance variables
    @board = board
    @history = history
    @goal_state = [[1,2,3],[4,5,6],[7,44,10]]
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


end
