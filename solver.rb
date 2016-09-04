require_relative 'puzzle'

p = State.new([[1,2,3],[4,5,6],[7,10,44]])
q = Queue.new
q << p
t =  p.get_board
num_Nodes = 0
# puts t[0][0].to_s
# puts "is the game solved? " << p.isSolved.to_s
while (!q.empty?)

  bo = q.pop
  if bo.isSolved
    break
  end
  bo.display_board
  x_coord = bo.index_zero.first
  y_coord = bo.index_zero[1]
  # each state added to the queue represents the expansion of another node

  # move left if possible
  if y_coord != 0
    state_copy = bo.dup
    state_copy.moveLeft(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move right if possible
  if y_coord != 2
    state_copy = bo.dup
    state_copy.moveRight(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move up if possible
  if x_coord != 0
    state_copy = bo.dup
    state_copy.moveUp(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move down if possible
  if x_coord != 2
    state_copy = bo.dup
    state_copy.moveDown(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end
end
puts "Puzzle was solved in " << num_Nodes.to_s << " nodes."


# puts "the index of zero is "
# p indexes
# p.display_board
# # puts p.index_zero[0]
# p.moveUp(p.index_zero[0], p.index_zero[1])
# p.moveLeft(p.index_zero[0], p.index_zero[1])
# p.moveUp(p.index_zero[0], p.index_zero[1])
# p.moveLeft(p.index_zero[0], p.index_zero[1])
# p.display_board
# p.display_history
# p.count_moves
## breath first search
