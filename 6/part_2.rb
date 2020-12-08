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
  set = group.first.split("")
  group.each do |answers|
    set &= answers.split("")
  end
  set.count
end
