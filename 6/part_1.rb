f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

groups = input.reduce([[]]) do |acc, line|
  if line == ""
    acc << []
  else
    acc.last << line unless line == ""
  end
  acc
end

groups.map do |group|
  set = Set.new
  group.each do |answers|
    set += answers.split("").to_set
  end
  set.count
end
