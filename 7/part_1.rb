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

valid_bags = []
previous_count = -1

while valid_bags.count != previous_count
  previous_count = valid_bags.count

  can_hold.keys.select { |k| !valid_bags.include?(k) }.each do |bag_name|
    if can_hold[bag_name].any? { |b| (["shiny gold"] + valid_bags).include?(b[:name]) }
      valid_bags << bag_name
    end
  end
end

puts valid_bags.count
