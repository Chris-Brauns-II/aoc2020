f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

EXPECTED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

potential_passes = input.reduce([[]]) do |acc, line|
  if line == ""
    acc << []
  else
    acc.last << line unless line == ""
  end
  acc
end

potential_passes.count do |pass|
  EXPECTED_FIELDS.all? do |field|
    pass.join(" ").include?(field)
  end
end

