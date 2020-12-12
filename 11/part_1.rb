f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map { |s| s.split("") }

def evolve(evolution)
  next_evolution = Array.new(evolution.count){Array.new(evolution.first.count)}

  (0..evolution.count - 1).each do |i|
    (0..evolution[i].count - 1).each do |j|
      adjacents = []

      (-1..1).each do |a|
        (-1..1).each do |b|
          row = i + a
          column = j + b

          next if row == i && column == j

          if (row >= 0 and row <= evolution.count - 1) && (column >= 0 and column <= evolution[i].count - 1)
            adjacents << evolution[row][column]
          end
        end
      end

      if evolution[i][j] == "L"
        if adjacents.count { |adj| adj == "#" }.zero?
          next_evolution[i][j] = "#"
        else
          next_evolution[i][j] = "L"
        end
      elsif evolution[i][j] == "#"
        if adjacents.count { |adj| adj == "#" } >= 4
          next_evolution[i][j] = "L"
        else
          next_evolution[i][j] = "#"
        end
      elsif evolution[i][j] == "."
        next_evolution[i][j] = "."
      end
    end
  end

  next_evolution
end

previous = nil
current = input

while previous != current
  previous = current
  current = evolve(current)
end

puts current.sum { |curr| curr.count { |c| c == "#" } }