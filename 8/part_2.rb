f = File.open("./input.txt")

input = f.readlines.map(&:chomp)

class Instruction
  attr_accessor :type, :value

  def initialize(type, value)
    @type = type
    @value = value
  end

  def to_s
    "#{type}: #{value}"
  end
end

module Solver
  def self.run(instructions)
    program_counter = 0
    visited_instructions = []
    accumulator = 0

    while !visited_instructions.include?(program_counter)
      instruction = instructions[program_counter]
      visited_instructions << program_counter

      begin
        case instruction.type
        when "jmp"
          program_counter += instruction.value
        when "nop"
          program_counter += 1
        when "acc"
          accumulator += instruction.value
          program_counter += 1
        end
      rescue => e
        puts accumulator

        raise "WIN?"
      end
    end

    {
      :accumulator => accumulator,
      :program_counter => program_counter
    }
  end
end

instructions = input.map do |i|
  type = i[/([a-z]{3})/]
  value = i[/([+-]\d+)/].to_i

  Instruction.new(type, value)
end

instructions.each_with_index do |ins, i|
  if ins.type == "nop"
    clone = instructions.clone
    clone[i] = Instruction.new("jmp", ins.value)
    puts Solver.run(clone)
  elsif ins.type == "jmp"
    clone = instructions.clone
    clone[i] = Instruction.new("nop", ins.value)
    puts Solver.run(clone)
  else
  end
end
