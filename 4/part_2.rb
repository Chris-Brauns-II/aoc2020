f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

potential_passes = input.reduce([[]]) do |acc, line|
  if line == ""
    acc << []
  else
    acc.last << line unless line == ""
  end
  acc
end

potential_passes.count do |pass|
  full = pass.join(" ")
  (_, byr) = full[/byr:\d{4}/]&.split(":")
  next false unless byr
  next false unless byr.to_i >= 1920 && byr.to_i <= 2002

  (_, iyr) = full[/iyr:\d{4}/]&.split(":")
  next false unless iyr
  next false unless iyr.to_i >= 2010 && iyr.to_i <= 2020

  (_, eyr) = full[/eyr:\d{4}/]&.split(":")
  next false unless eyr
  next false unless eyr.to_i >= 2020 && eyr.to_i <= 2030

  (_, hgt) = full[/hgt:\d+(cm|in)/]&.split(":")
  next false unless hgt
  unit = hgt[-2..-1]
  measure = hgt[0..-3]
  next false unless (unit == "cm" && measure.to_i >= 150 && measure.to_i <= 193) || (unit == "in" && measure.to_i >= 59 && measure.to_i <= 76)

  (_, hcl) = full[/hcl:#[0-9a-f]{6}/]&.split(":")
  next false unless hcl

  (_, ecl) = full[/ecl:(amb|brn|blu|gry|grn|hzl|oth)/]&.split(":")
  next false unless ecl

  (_, pid) = full[/pid:\d+/]&.split(":")
  next false unless pid
  next false unless pid.length == 9

  true
end
