require "prime"

f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

reference = input[0].to_i
buses = input[1].split(",").map(&:to_i).each_with_index.map.to_a.reject { |(b, _)| b == 0 }

def extended_gcd(a, b)
  return 1, 0 if b == 0
  quotient = a / b
  remainder = a % b

  m, n = extended_gcd(b, remainder)

  return n, (m - quotient * n)
end

products = buses.map do |bus_index|
  (bus, index) = bus_index

  product = buses.reject { |(b, _)| b == bus }.map { |(b, _)| b }.reduce(&:*)

  (_, multiple) = extended_gcd(bus, product)

  (product * multiple * (bus - index))
end

puts products.sum % buses.map { |(b, _)| b }.reduce(&:*)