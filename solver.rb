require_relative 'puzzle'
require 'pry'

def copy_board(b)
  puts "copying the board"
  newb = Array.new
  b.each do |row|
    r = []
    r << row[0] << row[1] << row[2]
    newb << r
  end
  newb
end

def copy_history(h)
  newh = Array.new
  h.each do |movement|
    newh << movement
  end
  newh
end

p = State.new([[10,1,3],[4,2,5],[7,44,6]],[])
q = Queue.new
q << p
t =  p.get_board
num_Nodes = 0
# puts t[0][0].to_s
# puts "is the game solved? " << p.isSolved.to_s
while (!q.empty?)
  puts "length of q is " << q.length.to_s
  bo = q.pop
  if bo.isSolved
    break
  end
  binding.pry
  bo.display_board
  x_coord = bo.index_zero.first
  y_coord = bo.index_zero[1]
  # each state added to the queue represents the expansion of another node

  # move left if possible
  if y_coord != 0 && bo.get_history.last != "right"
    binding.pry
    state_copy = State.new(copy_board(bo.get_board), copy_history(bo.get_history))
    state_copy.moveLeft(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move right if possible
  if y_coord != 2 && bo.get_history.last != "left"
    binding.pry
    state_copy = State.new(copy_board(bo.get_board), copy_history(bo.get_history))
    state_copy.moveRight(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move up if possible
  if x_coord != 0 && bo.get_history.last != "down"
    binding.pry
    state_copy = State.new(copy_board(bo.get_board), copy_history(bo.get_history))
    state_copy.moveUp(x_coord,y_coord)
    q.push(state_copy)
    num_Nodes += 1
  end

  # move down if possible
  if x_coord != 2 && bo.get_history.last != "up"
    binding.pry
    state_copy = State.new(copy_board(bo.get_board), copy_history(bo.get_history))
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
