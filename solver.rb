# Robert Ip, CISC 3410, Program #1
require_relative 'puzzle'
require_relative 'priorityq'
require 'pry'

def copy_board(b)
  newb = Array.new
  b.each do |row|
    r = Array.new
    r << row[0] << row[1] << row[2]
    newb << r
  end
  # binding.pry
  newb
end

def copy_history(h)
  newh = Array.new
  h.each do |movement|
    newh << movement
  end
  newh
end

num_Nodes_Expanded = 0
new_game = State.new([[1,2,3],[4,10,5],[7,8,6]],[])
# p = State.new([[4,10,5],[7,8,6],[1,2,3]],[])


###########################################################################################################################
## A* SEARCH
pq = PriorityQueue.new
pq << new_game
while !pq.empty
  board = pq.pop
  # move left if possible and resulting state has not been visited yet
  if y_coord != 0 && bo.get_history.last != "right"
    # binding.pry
    copyb = copy_board(board.get_board)
    copyh = copy_history(board.get_history)
    state_copy = State.new(copyb, copyh)
    state_copy.moveLeft(x_coord,y_coord)
    stack << state_copy
    num_Nodes_Expanded += 1
    end
  end

 # move right if possible and resulting state has not been visited yet
  if y_coord != 2 && bo.get_history.last != "left"
    # binding.pry
    copyb = copy_board(board.get_board)
    copyh = copy_history(board.get_history)
    state_copy = State.new(copyb, copyh)
    state_copy.moveRight(x_coord,y_coord)
    stack << state_copy
    num_Nodes_Expanded += 1
  end

  # move up if possible and resulting state has not been visited yet
  if x_coord != 0 && bo.get_history.last != "down"
    copyb = copy_board(board.get_board)
    copyh = copy_history(board.get_history)
    state_copy = State.new(copyb, copyh)
    state_copy.moveUp(x_coord,y_coord)
    stack << state_copy
    num_Nodes_Expanded += 1
  end

  # move down if possible and resulting state has not been visited yet
  if x_coord != 2 && bo.get_history.last != "up"
    # binding.pry
    copyb = copy_board(board.get_board)
    copyh = copy_history(board.get_history)
    state_copy = State.new(copyb, copyh)
    state_copy.moveDown(x_coord,y_coord)
    stack << state_copy
    num_Nodes_Expanded += 1
  end
end
# look for the vertex n that has the lowest f(n) = g(n) + h(n)
# g(n) represents the exact cost of the path from the starting point to any vertex n
# h(n) represents the heuristic estimated cost from vertex n to the goal (the sum of the manhattan distance for all tiles)
###########################################################################################################################

 ## DEPTH FIRST SEARCH
#  visited_states = Hash.new
#  stack = Array.new
#  stack << new_game
#  while !stack.empty?
#   #  binding.pry
#    bo = stack.pop
#    binding.pry
#    if bo.isSolved
#      break
#    end
#    visited_states[bo.get_board] = true
#    x_coord = bo.index_zero.first
#    y_coord = bo.index_zero[1]
#    # mark this state as already visited
#
#    # add adjacent nodes to the stack IFF these nodes have not yet been visited
#    # each time a node is added to the stack, increment visited_nodes
#
#    # move left if possible and resulting state has not been visited yet
#    if y_coord != 0 && bo.get_history.last != "right"
#      # binding.pry
#      copyb = copy_board(bo.get_board)
#      copyh = copy_history(bo.get_history)
#      state_copy = State.new(copyb, copyh)
#      state_copy.moveLeft(x_coord,y_coord)
#      key = state_copy.get_board
#      if !visited_states.has_key?(key)
#        visited_states[:key] = true
#        stack << state_copy
#        num_Nodes_Expanded += 1
#      end
#    end
#
#   # move right if possible and resulting state has not been visited yet
#    if y_coord != 2 && bo.get_history.last != "left"
#      # binding.pry
#      copyb = copy_board(bo.get_board)
#      copyh = copy_history(bo.get_history)
#      state_copy = State.new(copyb, copyh)
#      state_copy.moveRight(x_coord,y_coord)
#      key = state_copy.get_board
#      if !visited_states.has_key?(key)
#        visited_states[:key] = true
#        stack << state_copy
#        num_Nodes_Expanded += 1
#      end
#    end
#
#    # move up if possible and resulting state has not been visited yet
#    if x_coord != 0 && bo.get_history.last != "down"
#      copyb = copy_board(bo.get_board)
#      copyh = copy_history(bo.get_history)
#      state_copy = State.new(copyb, copyh)
#      state_copy.moveUp(x_coord,y_coord)
#      key = state_copy.get_board
#      if !visited_states.has_key?(key)
#        visited_states[:key] = true
#        stack << state_copy
#        num_Nodes_Expanded += 1
#      end
#    end
#
#    # move down if possible and resulting state has not been visited yet
#    if x_coord != 2 && bo.get_history.last != "up"
#      # binding.pry
#      copyb = copy_board(bo.get_board)
#      copyh = copy_history(bo.get_history)
#      state_copy = State.new(copyb, copyh)
#      state_copy.moveDown(x_coord,y_coord)
#      key = state_copy.get_board
#      if !visited_states.has_key?(key)
#        visited_states[:key] = true
#        stack << state_copy
#        num_Nodes_Expanded += 1
#      end
#      # binding.pry
#    end
# end

###########################################################################################################################
#  ## BREADTH FIRST SEARCH
# q = Queue.new
# q << new_game
# t =  new_game.get_board
# # puts t[0][0].to_s
# # puts "is the game solved? " << p.isSolved.to_s
# while (!q.empty?)
#   puts "length of q is " << q.length.to_s
#   bo = q.pop
#   if bo.isSolved
#     bo.display_history
#     break
#   end
#
#   bo.display_board
#   x_coord = bo.index_zero.first
#   y_coord = bo.index_zero[1]
#   # each state added to the queue represents the expansion of another node
#
#   # move left if possible
#   if y_coord != 0 && bo.get_history.last != "right"
#     copyb = copy_board(bo.get_board)
#     copyh = copy_history(bo.get_history)
#     state_copy = State.new(copyb, copyh)
#     state_copy.moveLeft(x_coord,y_coord)
#     q.push(state_copy)
#     num_Nodes_Expanded += 1
#   end
#
#   # move right if possible
#   if y_coord != 2 && bo.get_history.last != "left"
#     # binding.pry
#     copyb = copy_board(bo.get_board)
#     copyh = copy_history(bo.get_history)
#     state_copy = State.new(copyb, copyh)
#     state_copy.moveRight(x_coord,y_coord)
#     q.push(state_copy)
#     num_Nodes_Expanded += 1
#   end
#
#   # move up if possible
#   if x_coord != 0 && bo.get_history.last != "down"
#     copyb = copy_board(bo.get_board)
#     copyh = copy_history(bo.get_history)
#     state_copy = State.new(copyb, copyh)
#     state_copy.moveUp(x_coord,y_coord)
#     q.push(state_copy)
#     num_Nodes_Expanded += 1
#   end
#
#   # move down if possible
#   if x_coord != 2 && bo.get_history.last != "up"
#     copyb = copy_board(bo.get_board)
#     copyh = copy_history(bo.get_history)
#     state_copy = State.new(copyb, copyh)
#     state_copy.moveDown(x_coord,y_coord)
#     q.push(state_copy)
#     num_Nodes_Expanded += 1
#   end
# end
# puts "Puzzle was solved in " << num_Nodes_Expanded.to_s << " nodes."
