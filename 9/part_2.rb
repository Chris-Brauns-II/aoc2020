f = File.open("./input.txt")

input = f.readlines.map(&:chomp).map(&:to_i)

(0..input.length).each do |i|
  (i + 1..input.length).each do |j|
    if input[i..j].sum == 530627549
      puts input[i..j].min
      puts input[i..j].max
    end
  end
end
