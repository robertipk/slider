# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/
require_relative 'searches'

new_game = State.new([[1,5,8],[4,2,7],[0,3,6]],[])
# new_game = State.new([[1,5,2,3],[4,0,10,7],[9,6,14,11],[8,12,13,15]],[])
# new_game = State.new([[4,1,2,0],[5,9,6,3],[12,8,10,7],[13,14,15,11]],[])
# new_game = State.new([[1,2,3,7],[8,4,5,6],[0,9,10,11],[12,13,14,15]],[])


# new_game = State.new([[1,2,3,0],[4,5,6,7],[8,9,10,11],[12,13,14,15]],[])


# astar_search(new_game)
dfs(new_game)
# bfs(new_game)
