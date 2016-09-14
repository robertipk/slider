# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/

# utility functions

#copy_board and copy_history make deep copies
def copy_board(b)
  newb = Array.new
  b.each do |row|
    r = Array.new
    row.each do |element|
      r << element
    end
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

# makes a two dimensional board from input file
def make_board(text)
  # convert the strings to integers
  text_arr = text.split(" ").map(&:to_i)
  new_board = Array.new
  if text_arr.length == 9
    # make a 3 X 3 slider puzzle
  3.times{
      row = Array.new
      3.times{
        row << text_arr.shift
      }
      new_board << row
  }
  elsif text_arr.length == 16
    # make a 4 X 4 slider puzzle
  4.times{
      row = Array.new
      4.times{
        row << text_arr.shift
      }
      new_board << row
  }
  end
  return new_board
end

# prints number of nodes expanded
def print_num_expanded(num_nodes_expanded)
  if num_nodes_expanded%500 == 0
    puts "Number of nodes expanded: " << num_nodes_expanded.to_s
  end
end
