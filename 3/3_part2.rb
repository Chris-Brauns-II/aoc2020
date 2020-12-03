f = File.open("./input.txt")
SLOPES = [1, 3, 5, 7, 1/2.to_f]

input = f.readlines.map(&:chomp)
input_count = input.count


final_input = input.map do |row|
  original_row = row
  while row.length < input_count * SLOPES.max
    row += original_row
  end
  row
end

tree_counts = SLOPES.reduce({}) do |acc, s|
  if s < 1
    acc[s.to_f] = 0
  else
    acc[s] = 0
  end
  acc
end

(0..input_count - 1).each do |i|
  SLOPES.each do |s|
    if s < 1
      inverted = 1 / s.to_f
      y = inverted * i
      if y > (input_count - 1)
      else
        tree_counts[s] += 1 if final_input[y][i] == "#"
      end
    else
      tree_counts[s] += 1 if final_input[i][i*s] == "#"
    end
  end
end

puts tree_counts.values.reduce(&:*)
