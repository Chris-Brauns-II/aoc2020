f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

x = 0
y = 0

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
    tx = wx
    ty = wy
    case value
    when 90
      wx = -1 * ty
      wy = tx
    when 180
      wx = -1 * tx
      wy = -1 * ty
    when 270
      wx = ty
      wy = -1 * tx
    when 0
    end
  when "R"
    tx = wx
    ty = wy
    case value
    when 90
      wx = ty
      wy = -1 * tx
    when 180
      wx = -1 * tx
      wy = -1 * ty
    when 270
      wx = -1 * ty
      wy = tx
    when 0
    end
  when "F"
    x += value * wx
    y += value * wy
  end
end

puts "#{x}, #{y}"
puts x.abs + y.abs