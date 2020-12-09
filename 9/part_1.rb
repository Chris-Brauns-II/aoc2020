f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map(&:to_i)

class Array
  def push_shift(o)
    push(o)
    shift
  end
end


window = []

input[0..24].each do |i|
  window << i
end

input[25..-1].each do |i|
  sums = window.combination(2).map(&:sum)

  if !sums.include?(i)
    puts i
    break
  end

  window.push_shift(i)
end