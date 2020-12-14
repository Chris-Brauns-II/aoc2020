f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

reference = input[0].to_i
buses = input[1].split(",").map(&:to_i).reject { |i| i == 0 }

closest_after = buses.map do |b|
  i = 0
  while i * b < reference
    i += 1
  end

  [b, b*i]
end

bus = closest_after.min { |(busa, multiplea), (busb, multipleb) | multiplea<=> multipleb }

puts bus[0] * (bus[1] - reference)
