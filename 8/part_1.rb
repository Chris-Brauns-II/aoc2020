f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

class Instruction
  attr_accessor :type, :value

  def initialize(type, value)
    @type = type
    @value = value
  end
end

instructions = input.map do |i|
  type = i[/([a-z]{3})/]
  value = i[/([+-]\d+)/].to_i

  Instruction.new(type, value)
end

program_counter = 0
visited_instructions = []
accumulator = 0

while !visited_instructions.include?(program_counter)
  instruction = instructions[program_counter]
  visited_instructions << program_counter

  case instruction.type
  when "jmp"
    program_counter += instruction.value
  when "nop"
    program_counter += 1
  when "acc"
    accumulator += instruction.value
    program_counter += 1
  end
end

puts accumulator
