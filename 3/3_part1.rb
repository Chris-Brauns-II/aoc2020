f = File.open("./3input.txt")
SLOPE = 3

input = f.readlines.map(&:chomp)
input_count = input.count


final_input = input.map do |row|
  original_row = row
  while row.length < input_count * SLOPE
    row += original_row
  end
  row
end

tree_count = 0
(0..input_count - 1).each do |i|
  tree_count += 1 if final_input[i][i*SLOPE] == "#"
end

puts tree_count
