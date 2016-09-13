# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/
require_relative 'searches'


aFile = File.new("output.txt", "w")

new_game = State.new([[3,1,0],[6,4,2],[7,8,5]],[])
# new_game = State.new([[1,5,2,3],[4,0,10,7],[9,6,14,11],[8,12,13,15]],[])
# new_game = State.new([[4,1,2,0],[5,9,6,3],[12,8,10,7],[13,14,15,11]],[])
# new_game = State.new([[1,2,3,7],[8,4,5,6],[0,9,10,11],[12,13,14,15]],[])


# new_game = State.new([[1,2,3,0],[4,5,6,7],[8,9,10,11],[12,13,14,15]],[])

#
astar_search(new_game,"astar.txt")
bfs(new_game,"bfs.txt")
dfs(new_game,"dfs.txt")
aFile.close
