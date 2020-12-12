f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map { |s| s.split("") }

def add_to_adjacents?(char)
  return true if ["#","L"].include?(char)
end

def evolve(evolution)
  next_evolution = Array.new(evolution.count){Array.new(evolution.first.count)}

  (0..evolution.count - 1).each do |i|
    (0..evolution[i].count - 1).each do |j|
      adjacents = []

      # puts "#{i}, #{j}"
      # UL
      (0..evolution.count - 1).each do |a|
        row = i - a
        column = j - a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)

        # puts "  UL: #{row}, #{column}"
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # U
      (0..evolution.count - 1).each do |a|
        row = i - a
        column = j
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # UR
      (0..evolution.count - 1).each do |a|
        row = i - a
        column = j + a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # L
      (0..evolution.count - 1).each do |a|
        row = i
        column = j - a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # R
      (0..evolution.count - 1).each do |a|
        row = i
        column = j + a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # BL
      (0..evolution.count - 1).each do |a|
        row = i + a
        column = j - a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # B
      (0..evolution.count - 1).each do |a|
        row = i + a
        column = j
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      # BR
      (0..evolution.count - 1).each do |a|
        row = i + a
        column = j + a
        next if row == i && column == j
        next unless (row >= 0 and row <= evolution.count - 1) and (column >= 0 and column <= evolution[i].count - 1)
        char = evolution[row][column]

        if add_to_adjacents?(char)
          adjacents << char
          break
        end
      end

      if evolution[i][j] == "L"
        if adjacents.count { |adj| adj == "#" }.zero?
          next_evolution[i][j] = "#"
        else
          next_evolution[i][j] = "L"
        end
      elsif evolution[i][j] == "#"
        if adjacents.count { |adj| adj == "#" } >= 5
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
