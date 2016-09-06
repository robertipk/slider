# Robert Ip, CISC 3410, Program #1
# https://github.com/robertipk/slider/

#copy_board and copy_history make deep copies
def copy_board(b)
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
