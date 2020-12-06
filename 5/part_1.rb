f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

module Finder
  def self.narrow(input, lower_bound, upper_bound, low_char, high_char)
    input.each do |c|
      range = upper_bound - lower_bound + 1

      if c == high_char
        lower_bound += range / 2
      else
        upper_bound -= range / 2
      end
    end
    return upper_bound
  end
end

seats = Array.new(128){Array.new(8){'OOO'}}

input.map do |i|
  row = Finder.narrow(i.split("")[0..-4], 0, 127, 'F', 'B')
  column = Finder.narrow(i.split("")[-3..-1], 0, 7, 'L', 'R')

  id = row * 8 + column

  seats[row][column] = id.to_s
end

pp seats