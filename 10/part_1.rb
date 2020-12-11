f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map(&:to_i)
input << 0 << input.max + 3
input = input.sort

counts = [0, 0, 0, 0]

(1..(input.count - 1)).each do |i|
  puts "#{input[i]}, #{input[i - 1]}"
  diff = input[i] - input[i - 1]

  counts[diff] += 1
end


puts counts
