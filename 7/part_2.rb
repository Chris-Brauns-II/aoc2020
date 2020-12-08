f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

can_hold = {}

input.each do |rule|
  rule.split("bags contain")
  (_, holder, holdees) = rule.split(/([a-z]+ [a-z]+) bags contain /)
  can_hold[holder] = holdees.split(",").map do |holdee|
    (_, quantity, name) = holdee.split(/(\d+) ([a-z]+ [a-z]+) bag/)
    {
      name: name,
      quantity: quantity.to_i
    }
  end
end

def capacity(name, can_hold)
  rule = can_hold[name]

  return (rule&.sum { |r| r[:quantity] } || 0) + (rule&.sum { |r| r[:quantity] * capacity(r[:name], can_hold) } || 0)
end

puts capacity("shiny gold", can_hold)