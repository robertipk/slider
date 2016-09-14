# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/

require_relative 'searches'
require_relative 'utility'
require 'pry'

time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
# create filenames for the output files
astar_filename = "astar_" + time + ".txt"
bfs_filename = "bfs_" + time + ".txt"
dfs_filename = "dfs_" + time + ".txt"

# read input file
# assumes that the file consists of just one line (as specified in the hw assignment)
input = File.read("puzzle.txt")
initial_board = make_board(input)
# binding.pry
new_game = State.new(initial_board,[])
# new_game = State.new([[3,1,0],[6,4,2],[7,8,5]],[])

# new_game = State.new([[3,1,0],[6,4,2],[7,8,5]],[])
# # new_game = State.new([[1,5,2,3],[4,0,10,7],[9,6,14,11],[8,12,13,15]],[])
# # new_game = State.new([[4,1,2,0],[5,9,6,3],[12,8,10,7],[13,14,15,11]],[])
# # new_game = State.new([[1,2,3,7],[8,4,5,6],[0,9,10,11],[12,13,14,15]],[])
#
# # new_game = State.new([[1,2,3,0],[4,5,6,7],[8,9,10,11],[12,13,14,15]],[])
astar_search(new_game,astar_filename)
bfs(new_game,bfs_filename)
dfs(new_game,dfs_filename)
