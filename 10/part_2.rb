f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map(&:to_i)
input << 0 << input.max + 3
input = input.sort
max = input.max

$cached_children = {}

def build_count(node, input, max)
  return $cached_children[node] if $cached_children[node]

  next_steps = input.select { |a| a <= node + 3 && a > node }

  return 1 if next_steps.empty?

  next_steps.sum { |ns| build_count(ns, input, max) }.tap do |v|
    $cached_children[node] = v
  end
end

puts build_count(0, input, max)
