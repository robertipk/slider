# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/
require_relative 'puzzle'
require_relative 'priorityq'
require_relative 'utility'
require 'pry'

# My implementations of A* search, IDA*, DFS, BFS
def astar_search(new_game,fileName)
  outfile = File.open(fileName, "w")
  outfile.syswrite("-----------------Executing A* search--------------------\n")
  start = Time.now
  num_Nodes_Expanded = 0
  fringe = PriorityQueue.new
  fringe << new_game
  while !fringe.empty?
    puts "Number of nodes expanded: " << num_Nodes_Expanded.to_s
    board = fringe.pop
    if board.isSolved
      outfile.syswrite "Number of nodes expanded: " << num_Nodes_Expanded.to_s << "\n"
      outfile.syswrite "Time taken: " << (Time.now-start).to_s << "\n"
      outfile.syswrite "Number of moves: " << board.get_history.length.to_s << "\n"
      outfile.syswrite "Moves to take: " << board.get_history.to_s << "\n"
      puts "Number of nodes expanded: " << num_Nodes_Expanded.to_s
      puts "Time taken: " << (Time.now-start).to_s
      board.display_history
      break
    end
    x_coord = board.index_zero.first
    y_coord = board.index_zero[1]

    # move left if possible and resulting state has not been visited yet
    if y_coord != 0 && board.get_history.last != "right"
      copyb = copy_board(board.get_board)
      copyh = copy_history(board.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveLeft(x_coord,y_coord)
      fringe << state_copy
      num_Nodes_Expanded += 1
    end

   # move right if possible and resulting state has not been visited yet
    if y_coord != board.get_board.length-1 && board.get_history.last != "left"
      copyb = copy_board(board.get_board)
      copyh = copy_history(board.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveRight(x_coord,y_coord)
      fringe << state_copy
      num_Nodes_Expanded += 1
    end

    # move up if possible and resulting state has not been visited yet
    if x_coord != 0 && board.get_history.last != "down"
      copyb = copy_board(board.get_board)
      copyh = copy_history(board.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveUp(x_coord,y_coord)
      fringe << state_copy
      num_Nodes_Expanded += 1
    end

    # move down if possible and resulting state has not been visited yet
    if x_coord != board.get_board.length-1 && board.get_history.last != "up"
      # binding.pry
      copyb = copy_board(board.get_board)
      copyh = copy_history(board.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveDown(x_coord,y_coord)
      fringe << state_copy
      num_Nodes_Expanded += 1
    end
  end
end

def dfs(new_game,fileName)
  outfile = File.open(fileName, "w")
  outfile.syswrite("-----------------Executing depth first search--------------------\n")
  start = Time.now
  num_Nodes_Expanded = 0
  visited_states = Hash.new
  stack = Array.new
  stack << new_game
  while !stack.empty?
    bo = stack.pop
    visited_states[bo] = true
    num_Nodes_Expanded += 1
    if bo.isSolved
    #  out << "Number of nodes expanded: " << num_Nodes_Expanded.to_s
    #  out << "Time taken: " << (Time.now-start).to_s
     outfile.syswrite "Number of nodes expanded: " << num_Nodes_Expanded.to_s << "\n"
     outfile.syswrite "Time taken: " << (Time.now-start).to_s << "\n"
     bo.display_history
     break
    end

    # and push its adjacent nodes onto the stack
    if !visited_states.has_key?(bo.get_board)
      visited_states[bo.get_board] = true

      x_coord = bo.index_zero.first
      y_coord = bo.index_zero[1]

      # expand the node and add the new nodes to the queue
      # as long as they're not in the frontier and haven't yet been visited

      # move left if possible and resulting state has not been visited yet
      if y_coord != 0 && bo.get_history.last != "right"
        copyb = copy_board(bo.get_board)
        copyh = copy_history(bo.get_history)
        state_copy = State.new(copyb, copyh)
        state_copy.moveLeft(x_coord,y_coord)
        key = state_copy.get_board
        if !visited_states.has_key?(key)
         visited_states[:key] = true
         stack << state_copy
        end
      end

      # move right if possible and resulting state has not been visited yet
       if y_coord != bo.get_board.length-1 && bo.get_history.last != "left"
         copyb = copy_board(bo.get_board)
         copyh = copy_history(bo.get_history)
         state_copy = State.new(copyb, copyh)
         state_copy.moveRight(x_coord,y_coord)
         key = state_copy.get_board
         if !visited_states.has_key?(key)
           visited_states[:key] = true
           stack << state_copy
         end
       end

       # move up if possible and resulting state has not been visited yet
       if x_coord != 0 && bo.get_history.last != "down"
         copyb = copy_board(bo.get_board)
         copyh = copy_history(bo.get_history)
         state_copy = State.new(copyb, copyh)
         state_copy.moveUp(x_coord,y_coord)
         key = state_copy.get_board
         if !visited_states.has_key?(key)
           visited_states[:key] = true
           stack << state_copy
         end
       end

       # move down if possible and resulting state has not been visited yet
       if x_coord != bo.get_board.length-1 && bo.get_history.last != "up"
         copyb = copy_board(bo.get_board)
         copyh = copy_history(bo.get_history)
         state_copy = State.new(copyb, copyh)
         state_copy.moveDown(x_coord,y_coord)
         key = state_copy.get_board
         if !visited_states.has_key?(key)
           visited_states[:key] = true
           stack << state_copy
         end
       end
     end
  end
end

def bfs(new_game,fileName)
  outfile = File.open(fileName, "w")
  outfile.syswrite("-----------------Executing breadth first search--------------------\n")
  start = Time.now
  num_Nodes_Expanded = 0
  q = Queue.new
  q << new_game
  while (!q.empty?)
    bo = q.pop
    num_Nodes_Expanded += 1
    if bo.isSolved
      outfile.syswrite "Number of nodes expanded: " << num_Nodes_Expanded.to_s << "\n"
      outfile.syswrite "Time taken: " << (Time.now-start).to_s << "\n"
      puts "Number of nodes expanded: " << num_Nodes_Expanded.to_s
      puts "Time taken: " << (Time.now-start).to_s
      bo.display_history
      break
    end
    x_coord = bo.index_zero.first
    y_coord = bo.index_zero[1]

    # expand the node and add the new nodes to the queue

    # move left if possible
    if y_coord != 0 && bo.get_history.last != "right"
      copyb = copy_board(bo.get_board)
      copyh = copy_history(bo.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveLeft(x_coord,y_coord)
      q.push(state_copy)
    end

    # move right if possible
    if y_coord != bo.get_board.length-1 && bo.get_history.last != "left"
      copyb = copy_board(bo.get_board)
      copyh = copy_history(bo.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveRight(x_coord,y_coord)
      q.push(state_copy)
    end

    # move up if possible
    if x_coord != 0 && bo.get_history.last != "down"
      copyb = copy_board(bo.get_board)
      copyh = copy_history(bo.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveUp(x_coord,y_coord)
      q.push(state_copy)
    end

    # move down if possible
    if x_coord != bo.get_board.length-1 && bo.get_history.last != "up"
      copyb = copy_board(bo.get_board)
      copyh = copy_history(bo.get_history)
      state_copy = State.new(copyb, copyh)
      state_copy.moveDown(x_coord,y_coord)
      q.push(state_copy)
    end
  end
end
