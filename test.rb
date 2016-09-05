def copy_board(b)
  puts "copying the board"
  newb = Array.new
  b.each do |row|
    r = Array.new
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

arr = [1,2,3,4,5]
newarr = copy_history(arr)

newarr[4] = 9999
p arr
p newarr



#
#
# t = [[10,1,3],[4,2,5],[7,44,6]]
#
#
# c = copy_board(t)
# p c
# p t
#
# c[0][0] = 999
# puts " c has been modified but t should not have been modified"
# p c
# p t
