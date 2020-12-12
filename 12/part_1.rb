f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

x = 0
y = 0
r = 0

wx = 10
wy = 1

input.each do |i|
  (_, instruction, value) = i.split(/([A-Z])(\d+)/)

  value = value.to_i

  case instruction
  when "N"
    wy += value
  when "S"
    wy -= value
  when "E"
    wx += value
  when "W"
    wx -= value
  when "L"
    r = (r - value.to_i) % 360
  when "R"
    r = (r + value.to_i) % 360
  when "F"
    case r
    when 90
      y += value
    when 180
      x -= value
    when 270
      y -= value
    when 0
      x += value
    else
      raise "DARN", r
    end
  end
end

puts x
puts y